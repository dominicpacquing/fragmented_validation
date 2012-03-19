ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, :force => true do |t|
    t.string :username
    t.string :password
    t.string :email
    t.timestamps
  end
end
