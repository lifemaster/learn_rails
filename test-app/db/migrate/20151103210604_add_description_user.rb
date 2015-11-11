class AddDescriptionUser < ActiveRecord::Migration
  def change
  	add_column :users, :description, :text # :table_name, :field_name, :SQL_data_type
  end
end
