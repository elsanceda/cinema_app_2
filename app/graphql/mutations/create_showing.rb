module Mutations
  class CreateShowing < Mutations::BaseMutation
    argument :timeslot, Integer, required: true
    argument :cinema_id, ID, required: true
    argument :movie_id, ID, required: true

    # type Types::ShowingType
    
    field :showing, Types::ShowingType
    field :errors, [String], null: false

    def resolve(timeslot: nil, cinema_id: nil, movie_id: nil)
      showing = Showing.new(timeslot: timeslot,
                            cinema_id: cinema_id,
                            movie_id: movie_id)
      if showing.save
        { showing: showing,
          errors: [] }
      else
        { showing: nil,
          errors: showing.errors.full_messages }
      end
    end
  end
end