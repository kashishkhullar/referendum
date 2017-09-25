class Optionstopollchange < ActiveRecord::Migration
  def change
  	remove_column :polls,:option_1_id,:integer
  	remove_column :polls,:option_2_id,:integer
  	remove_column :polls,:option_3_id,:integer
  	remove_column :polls,:option_4_id,:integer
  	remove_column :polls,:option_5_id,:integer
  	add_column :polls,:option_1,:string
  	add_column :polls,:option_2,:string
  	add_column :polls,:option_3,:string
  	add_column :polls,:option_4,:string
  	add_column :polls,:option_5,:string


  end
end
