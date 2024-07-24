class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])
    @products = Product.where(category_id: @category.id)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.create(category_params)
    if @category.save
      redirect_to root_path
      flash[:success] = 'Category Lounched successfully .'
    else
      render :new, status: :unprocessable_entity
      flash.now[:alert] = 'Something went wrong!'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to category_path(@category)
      flash[:success] = 'Category Updated successfully .'
    else
      render :edit, status: :unprocessable_entity
      flash.now[:alert] = 'Something went wrong!'
    end
  end
  
  private

    def category_params
      params.require(:category).permit(:name, :cat_image)
    end
end