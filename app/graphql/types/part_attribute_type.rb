module Types
    class PartAttributeType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :price, Float, null: false
      field :stock, Boolean, null: false
    end
  end
  