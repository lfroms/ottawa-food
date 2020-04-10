class User < ApplicationRecord
  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :favorites
  has_many :favorite_restaurants, through: :favorites, source: :restaurant
end
