class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    @sub_category = SubCategory.find(params[:sub_category_id])
    if user_signed_in? && current_user.seller? 
      @products = current_user.products.where(sub_category: @sub_category)
    else
      @products = Product.all

    end

  end

  def new
    @sub_category = SubCategory.find(params[:sub_category_id])
    @product = Product.new
  end

  def create
    debugger
    @sub_category = SubCategory.find(params[:sub_category_id])
    @category = Category.find(params[:category_id])
  
    @product = current_user.products.new(product_params)
    @product.sub_category = @sub_category
    @product.category = @category
    
    if @product.save
      redirect_to category_sub_category_products_path(@sub_category.category, @sub_category), notice: 'Product launched successfully.'
    else
      render :new
    end
  end
  

  def edit
  end

  def update
    
    if @product.update(product_params)
      redirect_to category_sub_category_products_path(@product)
      flash[:success] = 'product Updated successfully .'
    else
      render :edit, status: :unprocessable_entity
      flash.now[:alert] = 'Something went wrong!'
    end
  end

  def show
  end

  def destroy
    @product.destroy
    redirect_to category_sub_category_products_path(@sub_category.category, @sub_category)
  end

  private

  def set_product 
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :cover_image, :description, :quantity)
  end
end
