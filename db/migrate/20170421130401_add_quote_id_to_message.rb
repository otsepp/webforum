class AddQuoteIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :quote_id, :integer
  end
end
