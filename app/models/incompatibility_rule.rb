class IncompatibilityRule < ApplicationRecord
  belongs_to :attribute_a, class_name: 'PartAttribute'
  belongs_to :attribute_b, class_name: 'PartAttribute'
  
  validate :distinct_attributes

  def distinct_attributes
    if attribute_a == attribute_b
      errors.add(:base, "Attributes must be distinct")
      false
    else
      true
    end
  end

  def self.incompatible?(attribute_a, attribute_b)
    where(attribute_a: attribute_a, attribute_b: attribute_b)
      .or(where(attribute_a: attribute_b, attribute_b: attribute_a))
      .exists? 
  end

end
