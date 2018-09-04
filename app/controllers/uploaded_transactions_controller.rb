require 'csv'

class UploadedTransactionsController < ApplicationController
  def new
    @agent = Agent.find(params[:agent_id])
    @uploaded_transaction = @agent.uploaded_seller_transactions.new
  end

  def create
    agent = Agent.find(params[:agent_id])
    uploaded_transaction = agent.uploaded_seller_transactions.create(uploaded_transaction_params)

    if uploaded_transaction.save
      redirect_to agent_path(agent), notice: "Transaction saved!"
    else
      # render "new"
      # redirect_to new_agent_uploaded_transactions_path(agent), notice: "Error saving Transaction!!!${uploaded_transaction.errors}"
      render json: uploaded_transaction.errors, status: 400
    end
  end

  def bulk_upload
    agent = Agent.find(params[:agent_id])
    import_counter = 0
    total_counter = 0
    CSV.foreach(params[:file].path, headers: true) do |row|
      total_counter +=1
      if UploadedTransaction.where(city: row["city"], address: row["address"], zip: row["zip"]).exists?
        next
      end
      t = UploadedTransaction.new
      t.address = row["address"]
      t.city = row["city"]
      t.state = row["state"]
      t.zip = row["zip"]
      t.listing_date = row["listing_date"]
      t.listing_price = row["listing_price"]
      t.selling_date = row["selling_date"]
      t.selling_price = row["selling_price"]
      t.status = row["status"]
      t.property_type = row["property_type"]
      t.listing_agent_id = agent.id
      t.selling_agent_id = agent.id
      t.save!
      import_counter +=1
    end
    redirect_to agent_path(agent), notice: "#{import_counter} of #{total_counter} transactions imported!"
  end

  private

  def uploaded_transaction_params
    params.require(:uploaded_transaction).permit(:address, :city, :state, :zip, :listing_agent, :listing_price, :listing_date, :selling_price, :selling_agent, :selling_date, :status, :property_type)
  end
end
