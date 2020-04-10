# frozen_string_literal: true
class User < ApplicationRecord
  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :favorites, dependent: :destroy
  has_many :favorite_restaurants, through: :favorites, source: :restaurant, dependent: :destroy

  has_many :bucket_list_items, dependent: :destroy
  has_many :bucket_list_restaurants, through: :bucket_list_items, source: :restaurant, dependent: :destroy
end
