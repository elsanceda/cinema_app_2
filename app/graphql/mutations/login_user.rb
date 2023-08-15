module Mutations
  class LoginUser < Mutations::BaseMutation
    # null true

    argument :credentials, Types::AuthProviderCredentialsInput, required: true

    type Types::UserType

    def resolve(credentials: nil)
      user = User.find_by(email: credentials[:email])
      if user&.authenticate(credentials[:password])
        context[:session][:user_id] = user.id
        user
      else
        raise GraphQL::ExecutionError.new('Invalid email/password combination')
      end
    end
  end
end