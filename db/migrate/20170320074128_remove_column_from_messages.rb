class RemoveColumnFromMessages < ActiveRecord::Migration
  def change
	remove_column :messages, :name, :string, null: false, default: ''
  end
end
