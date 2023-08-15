module Mutations
  class CreateMovie < Mutations::BaseMutation
    argument :title, String, required: true
    argument :synopsis, String, required: true

    # type Types::MovieType
    
    field :movie, Types::MovieType
    field :errors, [String], null: false

    def resolve(title: nil, synopsis: nil)
      movie = Movie.new(title: title,
                        synopsis: synopsis)
      if movie.save
        { movie: movie,
          errors: [] }
      else
        { movie: nil,
          errors: movie.errors.full_messages }
      end
    end
  end
end