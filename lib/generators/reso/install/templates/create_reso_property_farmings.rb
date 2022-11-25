class CreateRESOPropertyFarmings < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_property_farmings do |t|
      t.references :property, null: false, foreign_key: { to_table: :reso_properties }
      
      t.boolean :crops_included_yn
      t.decimal :cultivated_area, precision: 14, scale: 2
      t.boolean :farm_credit_service_incl_yn
      t.boolean :grazing_permits_blm_yn
      t.boolean :grazing_permits_forest_service_yn
      t.boolean :grazing_permits_private_yn
      t.decimal :pasture_area, precision: 14, scale: 2
      t.decimal :range_area, precision: 14, scale: 2
      t.decimal :wooded_area, precision: 14, scale: 2

      t.timestamps
    end
  end
end
