class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      #Authlogic Stuff
      t.string :login
      t.string :crypted_password
      t.string :password_salt
      t.string :persistance_token

      t.timestamps
    end
  end
end
