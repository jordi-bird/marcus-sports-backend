class PriceRule < ApplicationRecord
    belongs_to :part_attribute
    belongs_to :dependency_part_attribute, class_name: 'PartAttribute'
  
    # Constants per als tipus d'operador
    OPERATORS = ['add', 'multiply'].freeze
  
    validates :part_attribute, presence: true
    validates :dependency_part_attribute, presence: true
    validates :operator, inclusion: { in: OPERATORS }
    validates :price_adjustment, numericality: true
  end