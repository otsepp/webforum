class AddModeratorCategoryIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :moderator_category_id, :integer
  end
end
