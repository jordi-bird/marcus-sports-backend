module Types
    class PartAttributeType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :price, Float, null: false
      field :stock, Boolean, null: true

      field :incompatible_attributes, [Types::PartAttributeType], null: false
      field :price_rules, [Types::PriceRuleType], null: true
      
      
      def incompatible_attributes
        # Obtenim les incompatibilitats per aquest atribut
        IncompatibilityRule
          .where("attribute_a_id = ? OR attribute_b_id = ?", object.id, object.id)
          .map { |rule|
            # Retornem els atributs incompatibles en funció de l'atribut actual
            rule.attribute_a_id == object.id ? rule.attribute_b : rule.attribute_a
          }
      end

      def price_rules
        object.price_rules
      end
    end
  end
  