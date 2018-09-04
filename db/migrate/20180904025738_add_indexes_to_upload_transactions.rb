class AddIndexesToUploadTransactions < ActiveRecord::Migration[5.1]
  def change
    add_index :uploaded_transactions, [:listing_agent_id, :selling_agent_id, :property_type, :selling_date], name: 'add_indexes_on_upload_transactions'
  end
end
