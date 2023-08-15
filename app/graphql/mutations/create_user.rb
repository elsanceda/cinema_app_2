module Mutations
  class CreateUser < Mutations::BaseMutation
    class AuthProviderSignupData < Types::BaseInputObject
      argument :mobile_number, String, required: true
      argument :credentials, Types::AuthProviderCredentialsInput, required: true
      argument :password_confirmation, String, required: true
    end

    argument :full_name, String, required: true
    argument :auth_provider, AuthProviderSignupData, required: true

    type Types::UserType

    def resolve(full_name: nil, auth_provider: nil)
      user = User.new(full_name: full_name,
                      mobile_number: auth_provider[:mobile_number],
                      email: auth_provider&.[](:credentials)&.[](:email),
                      password: auth_provider&.[](:credentials)&.[](:password),
                      password_confirmation: auth_provider[:password_confirmation])
      if user.save
        user
      else
        build_errors(user)
        return
      end
    end

    def build_errors(user)
      user.errors.full_messages.each do |message|
        context.add_error(GraphQL::ExecutionError.new(message))
      end
    end
  end
end