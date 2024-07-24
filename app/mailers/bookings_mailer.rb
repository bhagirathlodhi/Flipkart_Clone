class BookingsMailer < ApplicationMailer

  default :from => 'no-reply@gmail.com'

  def success_booking(booking)
    @booking = booking
    @product = @booking.product
    mail to: "abc@gmail.com", subject: "Booking Confirmation for #{@product.name}"
  end

end
