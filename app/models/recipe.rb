class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many_attached :photos

  validates :title, :description, presence: true
end
