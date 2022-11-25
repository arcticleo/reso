class CreateRESOProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_properties do |t|
      t.string :universal_property_id, limit: 128
      t.string :universal_property_sub_id, limit: 128
      t.json :input

      t.timestamps
    end
    add_index :reso_properties, :universal_property_id
    add_index :reso_properties, :universal_property_sub_id
  end
end
