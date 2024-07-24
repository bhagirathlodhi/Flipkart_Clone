class ProductsController < ApplicationController
  def index
    @sub_category = SubCategory.find(params[:sub_category_id])
    if user_signed_in? && current_user.seller? 
      @products = current_user.products.where(sub_category: @sub_category)
    else
      @q = Product.ransack(params[:q])

      @products = @q.result(distinct: true)
    end

  end

  def new
    @sub_category = SubCategory.find(params[:sub_category_id])
    @product = Product.new
  end

  def create
    @sub_category = SubCategory.find(params[:sub_category_id])
    @product = current_user.products.new(product_params)
    @product.sub_category = @sub_category
    if @product.save
      redirect_to category_sub_category_products_path(@sub_category.category, @sub_category)
      flash[:success] = 'Product launched successfully.'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to category_sub_category_products_path(@product)
      flash[:success] = 'product Updated successfully .'
    else
      render :edit, status: :unprocessable_entity
      flash.now[:alert] = 'Something went wrong!'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to category_sub_category_products_path(@sub_category.category, @sub_category)
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :cover_image, :description, :quantity)
  end
end
