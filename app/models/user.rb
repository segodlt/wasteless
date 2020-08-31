class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :favorites, dependent: :destroy
  has_many :reviews
  has_many :recipes
  has_many :groceries, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
