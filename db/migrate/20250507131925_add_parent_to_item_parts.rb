class AddParentToItemParts < ActiveRecord::Migration[8.0]
  def change
    add_reference :item_parts, :parent, null: false, foreign_key: { to_table: :item_parts }, null: true
  end
end
