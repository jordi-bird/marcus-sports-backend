class CreateIncompatibilityRules < ActiveRecord::Migration[8.0]
  def change
    create_table :incompatibility_rules do |t|
      t.references :attribute_a, null: false, foreign_key: { to_table: :part_attributes }
      t.references :attribute_b, null: false, foreign_key: { to_table: :part_attributes }

      t.timestamps
    end
  end
end
