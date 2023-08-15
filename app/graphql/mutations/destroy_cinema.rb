module Mutations
  class DestroyCinema < Mutations::BaseMutation
    argument :id, ID, required: true

    type Boolean, null: false

    def resolve(id: nil)
      cinema = Cinema.find(id)
      if cinema.destroy
        true
      else
        false
      end
    end
  end
end