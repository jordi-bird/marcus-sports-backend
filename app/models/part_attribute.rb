class PartAttribute < ApplicationRecord
  belongs_to :item_part

  has_many :incompatibility_rules_as_a, class_name: 'IncompatibilityRule', foreign_key: :attribute_a_id
  has_many :incompatibility_rules_as_b, class_name: 'IncompatibilityRule', foreign_key: :attribute_b_id

  def incompatible_with?(other)
    IncompatibilityRule.incompatible?(self, other)
  end

  def incompatible_with
    (incompatibility_rules_as_a.map(&:attribute_b) + incompatibility_rules_as_b.map(&:attribute_a)).uniq
  end
end
