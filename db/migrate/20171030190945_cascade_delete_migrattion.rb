class CascadeDeleteMigrattion < ActiveRecord::Migration
  def change
  	  
  	remove_foreign_key :polls, :voters

  	    # add the new foreign_key
  	    
  	  # remove the old foreign_key
    remove_foreign_key :votes, :options


    # add the new foreign_key
    add_foreign_key :votes, :options, on_delete: :nullify
    add_foreign_key :polls, :voters, on_delete: :nullify


  end
end
