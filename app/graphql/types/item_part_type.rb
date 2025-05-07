module Types
    class ItemPartType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :description, String, null: true
      field :parent, Types::ItemPartType, null: true
      field :children, [Types::ItemPartType], null: true
      field :part_attributes, [Types::PartAttributeType], null: true
    end
  end
  