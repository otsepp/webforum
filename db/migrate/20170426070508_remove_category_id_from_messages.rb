class RemoveCategoryIdFromMessages < ActiveRecord::Migration
  def change
	remove_column :messages, :category_id, :integer
  end
end
