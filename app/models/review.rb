class Review < ApplicationRecord
  belongs_to :musician
  belongs_to :user
  validates :rating, presence: true
end
