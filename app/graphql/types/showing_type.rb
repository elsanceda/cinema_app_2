# frozen_string_literal: true

module Types
  class ShowingType < Types::BaseObject
    field :id, ID, null: false
    field :timeslot, Integer, null: false
    field :cinema, Types::CinemaType, null: false
    field :movie, Types::MovieType, null: false
    field :bookings, [Types::BookingType], null: false
    field :booked_seats, [Integer], null: false
    field :available_seats, [Integer], null: false
    # field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    # field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
