class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :type
      t.datetime :date_emitted
      t.datetime :date_recorded
      t.string :payload
      t.string :shared_secret
      t.string :user_ID
      t.string :user_agent
      t.string :source

      t.timestamps
    end
  end
end
