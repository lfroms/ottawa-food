# frozen_string_literal: true
class Recommendation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
end
