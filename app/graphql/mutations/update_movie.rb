module Mutations
  class UpdateMovie < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: true
    argument :synopsis, String, required: true

    # type Types::MovieType
    
    field :movie, Types::MovieType
    field :errors, [String], null: false

    def resolve(id: nil, title: nil, synopsis: nil)

      if context[:current_user]&.admin?
        movie = Movie.find(id)

        if movie.update(title: title, synopsis: synopsis)
          { movie: movie,
            errors: [] }
        else
          { movie: movie,
            errors: movie.errors.full_messages }
        end
        
      else
        raise GraphQL::ExecutionError.new('You must be logged in as an admin to proceed')
      end
    end
  end
end