require 'rails_helper'

RSpec.describe UploadedTransaction, type: :model do
  
  describe "#full_address" do
    let(:uploaded_transaction) { create :uploaded_transaction, address: "555 Mission St", city: "San Francisco", state: "CA", zip: "95512"}

    it "should display the concatinated address" do
      expect(uploaded_transaction.full_address).to eq "555 Mission St, San Francisco, CA 95512"
    end
  end
end
