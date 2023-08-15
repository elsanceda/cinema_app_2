module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :login_user, mutation: Mutations::LoginUser
    field :logout_user, mutation: Mutations::LogoutUser
    field :create_cinema, mutation: Mutations::CreateCinema
    field :update_cinema, mutation: Mutations::UpdateCinema
    field :destroy_cinema, mutation: Mutations::DestroyCinema
    field :create_movie, mutation: Mutations::CreateMovie
    field :update_movie, mutation: Mutations::UpdateMovie
    field :destroy_movie, mutation: Mutations::DestroyMovie
  end
end
