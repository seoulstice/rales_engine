require 'rails_helper'

describe "Merchants API" do
  context "HTTP GET with most_revenue query" do
    it "returns Merchant(s) with most revenue" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      merchant3 = create(:merchant)

      invoice1 = create(:invoice, merchant: merchant1)
      invoice2 = create(:invoice, merchant: merchant1)
      invoice3 = create(:invoice, merchant: merchant1)
      invoice4 = create(:invoice, merchant: merchant2)
      invoice5 = create(:invoice, merchant: merchant2)
      invoice6 = create(:invoice, merchant: merchant3)

      create(:invoice_item, invoice: invoice1)
      create(:invoice_item, invoice: invoice2)
      create(:invoice_item, invoice: invoice3)
      create(:invoice_item, invoice: invoice4)
      create(:invoice_item, invoice: invoice5)
      create(:invoice_item, invoice: invoice6)

      get '/api/v1/merchants/most_revenue?quantity=2'

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants.class).to eq(Array)
      expect(merchants[0][:id]).to eq(merchant1.id)
      expect(merchants[1][:id]).to eq(merchant2.id)

    end
  end
end
