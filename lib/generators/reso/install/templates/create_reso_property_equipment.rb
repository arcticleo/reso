class CreateRESOPropertyEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_property_equipment do |t|
      t.references :property, null: false, foreign_key: { to_table: :reso_properties }

      t.timestamps
    end
  end
end
