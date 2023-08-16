module Mutations
  class DestroyBooking < Mutations::BaseMutation
    argument :id, ID, required: true

    type Boolean, null: false

    def resolve(id: nil)
      booking = Booking.find(id)
      if booking.destroy
        true
      else
        false
      end
    end
  end
end