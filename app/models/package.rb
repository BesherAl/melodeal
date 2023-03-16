class Package < ApplicationRecord
  belongs_to :musician
  has_many :bookings
  validates :title, presence: true
end
