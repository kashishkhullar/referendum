class AddIpandUsernameToVoter < ActiveRecord::Migration
  def change
  	add_column :voters,:username,:string
  	add_column :voters,:ip,:string
  end
end
