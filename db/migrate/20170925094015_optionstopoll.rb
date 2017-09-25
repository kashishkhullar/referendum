class Optionstopoll < ActiveRecord::Migration
  def change
  	add_column :polls,:option_1_id,:integer
  	add_column :polls,:option_2_id,:integer
  	add_column :polls,:option_3_id,:integer
  	add_column :polls,:option_4_id,:integer
  	add_column :polls,:option_5_id,:integer

  end
end
