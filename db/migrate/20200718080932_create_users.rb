class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""
      ## User Info
      t.string :email
      t.string :password

      t.timestamps
    end

    add_index :users, :email,                unique: true
  end
end
