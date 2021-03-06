class Lesson < ApplicationRecord
  has_one :activity, as: :action, dependent: :destroy
  belongs_to :user
  belongs_to :category
  has_many :answers
  has_many :words, through: :answers
  has_many :choices, through: :answers
  
  def next_word
    (category.words - words).first
  end

  def lesson_results
    choices.where(is_correct: true).count
  end
end
