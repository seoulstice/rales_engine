require 'rails_helper'

describe "Merchant Invoices API" do
  context "HTTP GET" do
    it "returns invoices for a merchant" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      invoice1 = create(:invoice, merchant: merchant1)
      invoice2 = create(:invoice, merchant: merchant2)
      invoice3 = create(:invoice, merchant: merchant1)

      get "/api/v1/merchants/#{merchant1.id}/invoices"

      expect(response).to be_successful

      invoices = JSON.parse(response.body, symbolize_names: true)

      expect(invoices[0][:id]).to eq(invoice1.id)
      expect(invoices[1][:id]).to eq(invoice3.id)
    end
  end
end
