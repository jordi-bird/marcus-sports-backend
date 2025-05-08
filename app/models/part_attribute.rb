class PartAttribute < ApplicationRecord
  belongs_to :item_part

  has_many :incompatibility_rules_as_a, class_name: 'IncompatibilityRule', foreign_key: :attribute_a_id
  has_many :incompatibility_rules_as_b, class_name: 'IncompatibilityRule', foreign_key: :attribute_b_id

  has_many :price_rules # Relació amb PriceRule
  has_many :dependency_price_rules, class_name: 'PriceRule', foreign_key: 'dependency_part_attribute_id' # Relació inversa per dependències


  def incompatible_with?(other)
    IncompatibilityRule.incompatible?(self, other)
  end

  def incompatible_with
    (incompatibility_rules_as_a.map(&:attribute_b) + incompatibility_rules_as_b.map(&:attribute_a)).uniq
  end

  # Mètode per obtenir el preu final d'un atribut
  def final_price(selected_options)
    # Si hi ha regles de preu associades
    price_adjustment = 0

    price_rules = PriceRule.where(part_attribute_id: id)

    price_rules.each do |rule|
      # Obtenim l'atribut dependent seleccionat
      dependency_attribute = selected_options[rule.dependency_part_attribute_id]

      # Si hi ha una selecció per l'atribut dependent
      if dependency_attribute
        case rule.operator
        when 'add'
          price_adjustment += rule.price_adjustment
        when 'multiply'
          price_adjustment += price * rule.price_adjustment
        end
      end
    end

    price + price_adjustment
  end
end
