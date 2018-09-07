class AddIndexesToUploadTransactions < ActiveRecord::Migration[5.1]
  def change
    add_index :uploaded_transactions, [:address, :zip, :selling_date], name: "index_uploaded_transactions_on_addr_zip_sell_date", unique: true
  end
end
