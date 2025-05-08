class CreatePriceRules < ActiveRecord::Migration[8.0]
  def change
    create_table :price_rules do |t|
      t.references :part_attribute, null: false, foreign_key: { to_table: :part_attributes } # Afegim foreign_key aquí
      t.references :dependency_part_attribute, null: false, foreign_key: { to_table: :part_attributes } # Afegim foreign_key aquí     
      t.string :operator, null: false
      t.decimal :price_adjustment, precision: 10, scale: 2, null: false
      
      t.timestamps
    end
  end
end
