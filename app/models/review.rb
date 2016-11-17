class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :rating, inclusion: 0..5
end
