module Types
  class AuthProviderCredentialsInput < Types::BaseInputObject
    graphql_name 'AUTH_PROVIDER_CREDENTIALS'

    argument :mobile_number, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true
  end
end