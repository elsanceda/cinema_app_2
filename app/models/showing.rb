class Showing < ApplicationRecord
  belongs_to :cinema
  belongs_to :movie
  default_scope -> { order(created_at: :desc) }
end
