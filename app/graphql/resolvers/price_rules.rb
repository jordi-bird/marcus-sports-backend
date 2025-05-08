# app/graphql/resolvers/price_rules.rb
module Resolvers
    class PriceRules < BaseResolver
      type [Types::PriceRuleType], null: false
  
      def resolve
        PriceRule.all
      end
    end
end