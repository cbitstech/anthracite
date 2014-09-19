class ChangePayloadTypeToText < ActiveRecord::Migration
  def up
    change_column :events, :payload, :text

  end

  def down
  end
end
