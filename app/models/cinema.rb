class Cinema < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :seats, presence: true, 
                    inclusion: { in: (1..10),
                                 message: "must be between 1-10" }
  default_scope -> { order(created_at: :desc) }
  has_many :showings, dependent: :destroy
  has_many :bookings, through: :showings
end
