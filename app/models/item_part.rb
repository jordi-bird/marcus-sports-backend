class ItemPart < ApplicationRecord
    belongs_to :item
    has_many :part_attributes, dependent: :destroy
end
