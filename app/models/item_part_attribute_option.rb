class ItemPartAttributeOption < ApplicationRecord
  belongs_to :item_part_attribute
  #has_many :incompatible_options_links, class_name: 'IncompatibleOption', foreign_key: 'option_id'
  #has_many :incompatible_with, through: :incompatible_options_links, source: :incompatible_with
end