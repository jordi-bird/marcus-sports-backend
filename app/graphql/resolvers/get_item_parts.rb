module Resolvers
    class GetItemParts < GraphQL::Schema::Resolver
      type [Types::ItemPartType], null: false
  
      def resolve
        ItemPart.all
      end
    end
  end
  