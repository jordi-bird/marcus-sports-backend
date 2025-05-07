module Resolvers
    class GetIncompatibilityRule < GraphQL::Schema::Resolver
      type Types::IncompatibilityRuleType, null: false
  
      argument :id, ID, required: true
  
      def resolve(id:)
        IncompatibilityRule.find(id)
      end
    end
end
  