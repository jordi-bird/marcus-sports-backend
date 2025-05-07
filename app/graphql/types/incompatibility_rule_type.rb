# app/graphql/types/incompatibility_rule_type.rb
module Types
    class IncompatibilityRuleType < Types::BaseObject
      field :id, ID, null: false
      field :attribute_a, Types::PartAttributeType, null: false
      field :attribute_b, Types::PartAttributeType, null: false
    end
  end
  