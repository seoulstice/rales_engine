require 'rails_helper'

describe "Merchants API" do
  context "HTTP GET" do
    it "returns the revenue for a single merchant" do
      merchant1 = create(:merchant)
      invoice1 = create(:invoice, merchant: merchant1, created_at: "2012-03-09 01:54:10 UTC" )
      invoice2 = create(:invoice, merchant: merchant1, created_at: "2012-03-09 01:54:10 UTC")
      create(:invoice_item, invoice: invoice1, quantity: 1, unit_price: 100)
      create(:invoice_item, invoice: invoice2, quantity: 2, unit_price: 100)
      create(:transaction, invoice: invoice1, result: "success")
      create(:transaction, invoice: invoice2, result: "failed")

      get "/api/v1/merchants/#{merchant1.id}/revenue"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant[:revenue]).to eq("1.00")
    end

    it "returns the total revenue for a merchant by invoice date" do
      merchant1 = create(:merchant)
      invoice1 = create(:invoice, merchant: merchant1, created_at: "2012-03-09 01:54:10 UTC" )
      invoice2 = create(:invoice, merchant: merchant1, created_at: "2012-03-09 01:54:10 UTC")
      create(:invoice_item, invoice: invoice1, quantity: 1, unit_price: 100)
      create(:invoice_item, invoice: invoice2, quantity: 2, unit_price: 100)
      create(:transaction, invoice: invoice1, result: "success")
      create(:transaction, invoice: invoice2, result: "failed")

      get "/api/v1/merchants/#{merchant1.id}/revenue?date=#{invoice1.created_at}"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant[:revenue]).to eq("1.00")
    end

    it "returns revenue for all merchants on a single date" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      merchant3 = create(:merchant)
      invoice1 = create(:invoice, merchant: merchant1, created_at: "2012-03-09 01:54:10 UTC")
      invoice2 = create(:invoice, merchant: merchant2, created_at: "2012-03-09 01:54:10 UTC")
      invoice3 = create(:invoice, merchant: merchant3, created_at: "2012-01-09 01:54:10 UTC")
      create(:invoice_item, invoice: invoice1, quantity: 2, unit_price: 100)
      create(:invoice_item, invoice: invoice2, quantity: 1, unit_price: 200)
      create(:invoice_item, invoice: invoice2, quantity: 1, unit_price: 300)
      create(:invoice_item, invoice: invoice3, quantity: 1, unit_price: 400)
      create(:transaction, invoice: invoice1, result: 'success')
      create(:transaction, invoice: invoice2, result: 'success')
      create(:transaction, invoice: invoice3, result: 'success')


      get "/api/v1/merchants/revenue?date=#{invoice1.created_at}"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant[:total_revenue]).to eq("7.00")
    end
  end
end
