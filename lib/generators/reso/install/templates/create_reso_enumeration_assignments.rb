class CreateResoEnumerationAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :reso_enumeration_assignments do |t|
      t.string :type
      t.references :enumerable, polymorphic: true, index: false
      t.references :enumeration, index: true
      t.timestamps
    end
    add_index :reso_enumeration_assignments, :type
    add_index :reso_enumeration_assignments,
      [:enumerable_type, :enumerable_id],
      {name: "index_on_enumerable_type_and_id"}
  end
end
