module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # /users; NOTE: FOR TEST PURPOSES ONLY, DELETE LATER?
    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    # /user
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end

    # Returns current user; NOTE: FOR TEST PURPOSES ONLY, DELETE LATER?
    field :current_user, Types::UserType
    def current_user
      context[:current_user]
    end

    # /cinemas
    field :cinemas, [Types::CinemaType], null: false
    def cinemas
      Cinema.all
    end

    # /cinema
    field :cinema, Types::CinemaType, null: false do
      argument :id, ID, required: true
    end
    def cinema(id:)
      Cinema.find(id)
    end

    # /movies
    field :movies, [Types::MovieType], null: false
    def movies
      Movie.all
    end

    # /movie
    field :movie, Types::MovieType, null: false do
      argument :id, ID, required: true
    end
    def movie(id:)
      Movie.find(id)
    end

    # /showings
    field :showings, [Types::ShowingType], null: false
    def showings
      Showing.all
    end

    # /showing
    field :showing, Types::ShowingType, null: false do
      argument :id, ID, required: true
    end
    def showing(id:)
      Showing.find(id)
    end
  end
end
