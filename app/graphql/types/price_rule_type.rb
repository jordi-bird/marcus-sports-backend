# app/graphql/types/price_rule_type.rb
module Types
    class PriceRuleType < BaseObject
      field :id, ID, null: false
      field :part_attribute_id, ID, null: false
      field :dependency_part_attribute_id, ID, null: false
      field :operator, String, null: false
      field :price_adjustment, Float, null: false
    end
  end
  