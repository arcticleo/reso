class CreateRESOEnumerations < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_enumerations do |t|
      t.string :type
      t.string :value
      t.string :display_name
      t.text :definition
      t.string :wiki_url

      t.timestamps
    end
    add_index :reso_enumerations, :type
    add_index :reso_enumerations, :value
    add_index :reso_enumerations, :display_name
  end
end
