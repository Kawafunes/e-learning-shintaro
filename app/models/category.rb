class Category < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
end

def index
  @title = title.all
  @description = description.all
end