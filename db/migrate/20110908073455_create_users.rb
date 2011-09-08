class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :persistence_token
      t.string :crypted_password
      t.string :password_salt

      t.timestamps
    end
  end
end
