class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|

    	t.references :voter, index: true, foreign_key: true
        t.text :message
        t.string :link


      t.timestamps null: false
    end
  end
end
