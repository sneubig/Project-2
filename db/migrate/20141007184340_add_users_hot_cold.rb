class AddUsersHotCold < ActiveRecord::Migration
  def change
  	add_column :users, :hot, :boolean, default: false
  	add_column :users, :cold, :boolean, default: false
  end
end
