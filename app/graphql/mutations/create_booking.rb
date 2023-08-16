module Mutations
  class CreateBooking < Mutations::BaseMutation
    argument :seat_number, Integer, required: true
    argument :showing_id, ID, required: true

    # type Types::BookingType
    
    field :errors, [String], null: false

    def resolve(seat_number: nil, showing_id: nil)
      booking = Booking.new(seat_number: seat_number,
                            showing_id: showing_id,
                            user: context[:current_user])
      if booking.save
        { errors: [] }
      else
        { errors: booking.errors.full_messages }
      end
    end
  end
end