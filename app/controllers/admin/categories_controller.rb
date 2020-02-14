class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
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

  def edit
    @category = Category.find(params[:id])
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end