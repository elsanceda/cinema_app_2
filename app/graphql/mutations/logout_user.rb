module Mutations
  class LogoutUser < Mutations::BaseMutation
    # null true

    type Boolean, null: false

    def resolve
      if context[:current_user].nil?
        false
      else
        context[:session][:user_id] = nil
        context[:current_user] = nil
        true
      end
    end
  end
end