# frozen_string_literal: true

module Types
  class CinemaType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :location, String, null: false
    field :seats, Integer, null: false
    field :showings, [Types::ShowingType], null: false
    field :bookings, [Types::BookingType], null: false
    # field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    # field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
