module Mutations
  class CreateCinema < Mutations::BaseMutation
    argument :name, String, required: true
    argument :location, String, required: true
    argument :seats, Integer, required: true

    # type Types::CinemaType
    
    field :cinema, Types::CinemaType
    field :errors, [String], null: false

    def resolve(name: nil, location: nil, seats: nil)
      cinema = Cinema.new(name: name,
                          location: location,
                          seats: seats)
      if cinema.save
        { cinema: cinema,
          errors: [] }
      else
        { cinema: nil,
          errors: cinema.errors.full_messages }
      end
    end
  end
end