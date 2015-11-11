class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :birthday
      t.text :description
      t.text :login
      t.text :password
      t.timestamps null: false
    end
  end
end
