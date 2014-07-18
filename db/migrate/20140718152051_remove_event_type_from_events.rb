class RemoveEventTypeFromEvents < ActiveRecord::Migration
  def change
		remove_column :events, :event_type
		add_column :events, :kind, :string 
  end
end
