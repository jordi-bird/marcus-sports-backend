class CompatibilityRule < Rule
    belongs_to :target_option, class_name: 'ItemPartAttributeOption', optional: true
    belongs_to :target_part, class_name: 'ItemPart', optional: true
  
    validate :target_presence
  
    def target_presence
      if target_option.nil? && target_part.nil?
        errors.add(:base, "Specify either a target_option or target_part")
      end
    end
  end
  