class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string  :status, default: 'started'
      t.integer :elapsed_time

      t.integer :player_id
      t.integer :session_id

      t.timestamps
    end
  end
end
