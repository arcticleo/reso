ActiveRecord::Schema.define do
  self.verbose = false

  create_table :members, :force => true do |t|
    t.string :name
  end

end
