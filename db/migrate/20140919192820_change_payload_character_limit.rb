class ChangePayloadCharacterLimit < ActiveRecord::Migration
  def up
    change_column :events, :payload, :text, :limit => nil

  end

  def down
  end
end
