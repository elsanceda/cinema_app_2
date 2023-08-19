module Mutations
  class DestroyCinema < Mutations::BaseMutation
    argument :id, ID, required: true

    type Boolean, null: false

    def resolve(id: nil)

      if context[:current_user]&.admin?
        cinema = Cinema.find(id)

        if cinema.destroy
          true
        else
          false
        end
        
      else
        raise GraphQL::ExecutionError.new('You must be logged in as an admin to proceed')
      end
    end
  end
end