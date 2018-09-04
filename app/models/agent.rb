class Agent < ApplicationRecord
  has_many :uploaded_seller_transactions, class_name: "UploadedTransaction", foreign_key: :listing_agent_id
  has_many :uploaded_buyer_transactions, class_name: "UploadedTransaction", foreign_key: :selling_agent_id

  def all_transactions(per_page = 10, page_number = 1)
    # binding.pry
    UploadedTransaction.where("listing_agent_id = ? OR selling_agent_id = ?", id, id).page(page_number).per(per_page).order( 'property_type != "land" DESC', 'property_type != "mobile_home" DESC', 'selling_date DESC')
  end

  def recent_transactions
    all_transactions.where("selling_date > ?", 6.months.ago)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
