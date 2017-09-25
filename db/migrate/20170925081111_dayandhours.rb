class Dayandhours < ActiveRecord::Migration
  def change
  	add_column :polls,:days,:integer
  	add_column :polls,:hours,:integer
  end
end
