class PriceModifierRule < Rule
    belongs_to :target_option, class_name: 'ItemPartAttributeOption'
  
    enum price_operator: { add: 0, multiply: 1 }, _prefix: true
  
    validates :price_modifier_value, presence: true
  end
  