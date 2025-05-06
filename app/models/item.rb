class Item < ApplicationRecord
    has_many :item_parts, dependent: :destroy
end
