module Mutations
  class DestroyMovie < Mutations::BaseMutation
    argument :id, ID, required: true

    type Boolean, null: false

    def resolve(id: nil)

      if context[:current_user]
        movie = Movie.find(id)

        if movie.destroy
          true
        else
          false
        end
        
      else
        raise GraphQL::ExecutionError.new('You must be logged in to proceed')
      end
    end
  end
end