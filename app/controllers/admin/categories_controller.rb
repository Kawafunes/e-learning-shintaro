class Admin::CategoriesController < ApplicationController
  def index
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash.now[:success] = "Add New Category"
      redirect_to admin_categories_url
    else
      flash.now[:danger] = 'Failed to sign-up'
      render "new"
    end
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end