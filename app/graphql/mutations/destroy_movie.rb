module Mutations
  class DestroyMovie < Mutations::BaseMutation
    argument :id, ID, required: true

    type Boolean, null: false

    def resolve(id: nil)
      movie = Movie.find(id)
      if movie.destroy
        true
      else
        false
      end
    end
  end
end