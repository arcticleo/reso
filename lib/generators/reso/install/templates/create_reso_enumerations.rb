class CreateResoEnumerations < ActiveRecord::Migration[5.2]
  def change
    create_table :reso_enumerations, :force => true do |t|
      t.string :name
      t.string :type
      t.timestamps
    end
    add_index :reso_enumerations, :type
    add_index :reso_enumerations, :name
    add_index :reso_enumerations, [:type, :name]
  end
end
