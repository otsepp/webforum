class AddForeignKeyToSubjects < ActiveRecord::Migration
  def change
	add_column :subjects, :category_id, :integer
  end
end
