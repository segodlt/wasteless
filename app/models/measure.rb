class Measure < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
  has_many :groceries, dependent: :destroy
end
