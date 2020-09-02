class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
  has_many :measures, dependent: :destroy
  has_many :ingredients, through: :measures
  accepts_nested_attributes_for :measures

  has_many :groceries, through: :measures

  validates :title, :description, presence: true

  def average_rating
    total_rating = 0

    self.reviews.each do |review|
      total_rating += review.rating
    end
    if total_rating != 0
      num_rating = self.reviews.length
      (total_rating / num_rating).to_i
    else
      return 0
    end
  end

  def listed
    @measure = Measure.find(params[:id])
    @measure.listed = true
    @measure.save
  end
end
