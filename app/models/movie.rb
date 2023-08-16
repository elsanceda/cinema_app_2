class Movie < ApplicationRecord
  validates :title, presence: true
  validates :synopsis, presence: true
  default_scope -> { order(created_at: :desc) }
  has_many :showings, dependent: :destroy
end
