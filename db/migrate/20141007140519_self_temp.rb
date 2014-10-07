class SelfTemp < ActiveRecord::Migration
  def change
  	add_column :users, :prev_min_temp, :integer
  	add_column :users, :prev_max_temp, :integer
  end
end
