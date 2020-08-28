class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :measures, dependent: :destroy
  accepts_nested_attributes_for :measures

  validates :title, :description, presence: true
end
