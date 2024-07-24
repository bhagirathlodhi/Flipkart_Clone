class SubCategoriesController < ApplicationController
  before_action :set_category, only: [:index, :new, :create]

  def index
    @sub_categories = @category.sub_categories
  end

  def new 
    @sub_category = @category.sub_categories.build
  end

  def create
    @user = current_user
    @sub_category = @category.sub_categories.build(sub_category_params.merge(user_id: @user.id))
    if @sub_category.save
      redirect_to category_sub_categories_path(@category), notice: 'SubCategory was successfully created.'
    else
      render :new
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def sub_category_params
    params.require(:sub_category).permit(:title, images: [])
  end
end
