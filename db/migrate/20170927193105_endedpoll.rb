class Endedpoll < ActiveRecord::Migration
  def change
  	add_column :polls,:ended,:boolean,default: false
  end
end
