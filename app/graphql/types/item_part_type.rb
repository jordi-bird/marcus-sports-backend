module Types
    class ItemPartType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :description, String, null: true
      field :parent_id, ID, null: true
  
      field :item_part_attributes, [Types::ItemPartAttributeType], null: false
      field :children, [Types::ItemPartType], null: true
    end
  end