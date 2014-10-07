class AddUsersCurrentTemp < ActiveRecord::Migration
  def change
  	add_column :users, :temp, :integer
  	add_column :users, :desc, :string
  	add_column :users, :wind, :string
  end
end
