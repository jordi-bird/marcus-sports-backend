module Resolvers
    class GetIncompatibilityRules < GraphQL::Schema::Resolver
      type [Types::IncompatibilityRuleType], null: false
    
      def resolve
        IncompatibilityRule.all
      end
    end
end
  