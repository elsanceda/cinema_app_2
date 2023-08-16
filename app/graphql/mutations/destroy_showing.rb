module Mutations
  class DestroyShowing < Mutations::BaseMutation
    argument :id, ID, required: true

    type Boolean, null: false

    def resolve(id: nil)
      showing = Showing.find(id)
      if showing.destroy
        true
      else
        false
      end
    end
  end
end