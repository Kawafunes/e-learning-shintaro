class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @lesson = Lesson.find(params[:lesson_id])
    if @lesson.next_word.nil?
      @lesson.update(result: @lesson.lesson_results)
      @lesson.create_activity(user: current_user)

      redirect_to lesson_url(@lesson)
    end
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @lesson.answers.create(answer_params)
    redirect_to new_lesson_answer_url(@lesson)
  end

  private
  def answer_params
    params.require(:answer).permit(:word_id , :choice_id)
end

end