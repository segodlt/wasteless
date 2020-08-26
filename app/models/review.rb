class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :rating, :content, presence: true
  validates :rating, :inclusion => { :in => 0..5, :message => "doit être compris entre 0 et 5" }
end
