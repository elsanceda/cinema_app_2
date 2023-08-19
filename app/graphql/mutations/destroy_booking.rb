module Mutations
  class DestroyBooking < Mutations::BaseMutation
    argument :id, ID, required: true

    type Boolean, null: false

    def resolve(id: nil)

      if context[:current_user]
        booking = Booking.find(id)

        if booking.destroy
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