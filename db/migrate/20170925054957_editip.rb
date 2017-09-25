class Editip < ActiveRecord::Migration
  def change
  	  	remove_column :voters,:ip

  	add_column :voters,:ip_address,:string
  end
end
