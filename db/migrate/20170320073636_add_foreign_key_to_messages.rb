class AddForeignKeyToMessages < ActiveRecord::Migration
  def change
	add_column :messages, :subject_id, :integer
  end
end
