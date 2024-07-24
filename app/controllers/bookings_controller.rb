class BookingsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: :payment_completed
  
  def my_bookings
    @bookings = current_user.bookings
  end

  def create
    begin
      @product = Product.find(params[:product_id])
      total_amount = @product.price * params[:no_of_product].to_i

      session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        metadata: {
          product_id: @product.id,
          no_of_product: params[:no_of_product],
          user_id: current_user.id
        },
        line_items: [{
          price_data: {
            currency: 'inr',
            product_data: {
              name: @product.name,
            },
            unit_amount: total_amount * 100,
          },
          quantity: 1,
        }],
        mode: 'payment',
        success_url: "#{root_url}my_bookings",
        cancel_url: root_url
        })
      flash[:success] = "You have successfully book & you will get mail with all details"
      redirect_to session.url, allow_other_host: true
    rescue Exception => e
      e.class
    end
  end  

  def payment_completed
    payload= request.body.read
    event= nil
    endpoint_secret= 'whsec_uCJ7svKTJIBJIrGcF116IC2jGu8XVTSS'
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    begin
      event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
    rescue  JSON::ParserError => e
      # Invalid payload
      status 400
      return
    end

    case event.type
    when 'checkout.session.completed'
      session = event.data.object
      @user= session.metadata.user_id
      @product_id = session.metadata.product_id
      @no_of_product = session.metadata.no_of_product
      @booking = Booking.create(no_of_product: @no_of_product, product_id: @product_id, user_id: @user)
      BookingsMailer.success_booking(@booking).deliver_now
    end
  end

  def show 
  end

  private

  def booking_params
    params.require(:booking).permit(:no_of_product).merge(product_id: params[:booking][:product_id])
  end
end


