class CreateRESOParentChildAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :reso_parent_child_assignments do |t|
      t.string :type, index: true
      t.references :parent, polymorphic: true, null: false
      t.references :child, polymorphic: true, null: false

      t.timestamps
    end
  end
end
