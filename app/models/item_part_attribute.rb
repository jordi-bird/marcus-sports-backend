class ItemPartAttribute < ApplicationRecord
  belongs_to :item_part
  has_many :item_part_attribute_options, dependent: :destroy
end
