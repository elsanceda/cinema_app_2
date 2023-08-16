# frozen_string_literal: true

module Types
  class ShowingType < Types::BaseObject
    field :id, ID, null: false
    field :timeslot, Integer
    field :cinema, Types::CinemaType, null: false, method: :cinema
    field :movie, Types::MovieType, null: false, method: :movie
    field :bookings, [Types::BookingType], null: false
    # field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    # field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
