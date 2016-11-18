class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  validates :rating, inclusion: 0..5
  validates :user, uniqueness: { scope: :restaurant, message: "has reviewed this restaurant already" }
end
