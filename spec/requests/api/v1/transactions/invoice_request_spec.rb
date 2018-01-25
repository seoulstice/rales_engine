require 'rails_helper'

describe "Merchant Items API" do
  context "HTTP GET" do
    it "returns invoice for a transaction" do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)
      transaction1 = create(:transaction, invoice: invoice1)
      transaction2 = create(:transaction, invoice: invoice2)

      get "/api/v1/transactions/#{transaction1.id}/invoice"

      expect(response).to be_successful

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(invoice[:id]).to eq(invoice1.id)
    end
  end
end
