module Mutations
  class UpdateCinema < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: true
    argument :location, String, required: true
    argument :seats, Integer, required: true

    # type Types::CinemaType
    
    field :cinema, Types::CinemaType
    field :errors, [String], null: false

    def resolve(id: nil, name: nil, location: nil, seats: nil)
      cinema = Cinema.find(id)
      if cinema.update(name: name, location: location, seats: seats)
        { cinema: cinema,
          errors: [] }
      else
        { cinema: cinema,
          errors: cinema.errors.full_messages }
      end
    end
  end
end