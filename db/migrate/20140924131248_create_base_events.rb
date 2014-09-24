class CreateBaseEvents < ActiveRecord::Migration
  def change
    create_table :base_events do |t|
      t.string :kind
      t.string :userID
      t.text :payload
      t.datetime :clientTimeStamp

      t.timestamps
    end
  end
end
