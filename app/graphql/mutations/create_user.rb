module Mutations
  class CreateUser < Mutations::BaseMutation
    class AuthProviderSignupData < Types::BaseInputObject
      argument :mobile_number, String, required: true
      argument :credentials, Types::AuthProviderCredentialsInput, required: true
      argument :password_confirmation, String, required: true
    end

    argument :full_name, String, required: true
    argument :auth_provider, AuthProviderSignupData, required: true

    # type Types::UserType

    field :user, Types::UserType
    field :errors, [String], null: false

    def resolve(full_name: nil, auth_provider: nil)
      user = User.new(full_name: full_name,
                      mobile_number: auth_provider[:mobile_number],
                      email: auth_provider&.[](:credentials)&.[](:email),
                      password: auth_provider&.[](:credentials)&.[](:password),
                      password_confirmation: auth_provider[:password_confirmation])
      if user.save
        { user: user,
          errors: [] }
      else
        { user: nil,
          errors: user.errors.full_messages }
      end
    end
  end
end