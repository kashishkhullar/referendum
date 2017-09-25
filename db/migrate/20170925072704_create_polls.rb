class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.text :title
      t.text :content
      t.references :voter, index: true, foreign_key: true
      t.timestamp :time_limit
      t.timestamp :end_time
      t.boolean :private ,default: false

      t.timestamps null: false
    end
  end
end
