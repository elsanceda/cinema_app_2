module Mutations
  class DestroyShowing < Mutations::BaseMutation
    argument :id, ID, required: true

    type Boolean, null: false

    def resolve(id: nil)

      if context[:current_user]
        showing = Showing.find(id)

        if showing.destroy
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