module Mutations
  class DestroyShowing < Mutations::BaseMutation
    argument :id, ID, required: true

    type Boolean, null: false

    def resolve(id: nil)

      if context[:current_user]&.admin?
        showing = Showing.find(id)

        if showing.destroy
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