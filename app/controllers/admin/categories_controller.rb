class Admin::CategoriesController < ApplicationController
  before_action :check_admin

  def index
    @categories = Category.paginate(page: params[:page], per_page: 6)
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

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to admin_categories_url
    else
      render "edit"
    end
  end

  def show
    @category = Category.find(params[:id])
    @words = @category.words
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to admin_categories_url
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end