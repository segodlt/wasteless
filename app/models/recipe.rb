class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews, dependent: :destroy

  validates :title, :description, presence: true
end
