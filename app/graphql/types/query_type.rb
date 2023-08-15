module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # /users NOTE: FOR TEST PURPOSES ONLY, DELETE LATER
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

    field :current_user, Types::UserType
    def current_user
      context[:current_user]
    end
  end
end
