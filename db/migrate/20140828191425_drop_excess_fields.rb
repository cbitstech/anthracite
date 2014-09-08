class DropExcessFields < ActiveRecord::Migration
  def change
    remove_column :events, :user_agent
    remove_column :events, :shared_secret
    remove_column :events, :date_emitted
    remove_column :events, :source
  end
end
