class LessonsController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @lesson = @category.lessons.create(user: current_user)
    redirect_to new_lesson_answer_url(@lesson)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def index
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
  end
end