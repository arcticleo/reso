class CreateRESOPropertyOccupantOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_property_occupant_owners do |t|
      t.references :property, null: false, foreign_key: { to_table: :reso_properties }
      
      t.string :occupant_name
      t.string :occupant_phone, limit: 16
      t.string :owner_name
      t.string :owner_phone, limit: 16

      t.timestamps
    end
  end
end
