module Mutations
  class DestroyCinema < Mutations::BaseMutation
    argument :id, ID, required: true

    type Boolean, null: false

    def resolve(id: nil)

      if context[:current_user]
        cinema = Cinema.find(id)

        if cinema.destroy
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