class CreatePartAttributes < ActiveRecord::Migration[8.0]
  def change
    create_table :part_attributes do |t|
      t.references :item_part, null: false, foreign_key: true
      t.string :name
      t.decimal :price
      t.boolean :stock

      t.timestamps
    end
  end
end
