ActiveRecord::Schema.define :version => 0 do
  create_table :bands, :force => true do |t|
    t.column :name, :string
    t.column :genre, :string
    t.column :country, :string
    t.column :size, :integer
  end
end
