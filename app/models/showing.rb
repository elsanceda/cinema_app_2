class Showing < ApplicationRecord
  belongs_to :cinema
  belongs_to :movie
  default_scope -> { order(created_at: :desc) }
  validates :cinema_id, presence: true
  validates :movie_id, presence: true
  validates :timeslot, presence: true
  validates :timeslot, uniqueness: { scope: :cinema,
                                     message: "for that cinema already taken" }
  has_many :bookings, dependent: :destroy
end
