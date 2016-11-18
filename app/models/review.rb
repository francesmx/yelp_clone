class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :rating, inclusion: 0..5
  validates :user, uniqueness: { scope: :restaurant, message: "has reviewed this restaurant already" }
end
