require 'rails_helper'

describe "Invoices API" do
  context "HTTP GET" do
    it "returns all invoices" do
      customer = create(:customer)
      merchant = create(:merchant)
      create(:invoice, merchant: merchant, customer: customer)
      create(:invoice, merchant: merchant, customer: customer)
      create(:invoice, merchant: merchant, customer: customer)
      create(:invoice, merchant: merchant, customer: customer)

      get '/api/v1/invoices'

      expect(response).to be_success

      invoices = JSON.parse(response.body)

      expect(invoices.count).to eq(4)
    end
    it "returns a specific invoice" do
      customer = create(:customer)
      merchant = create(:merchant)
      id = create(:invoice, merchant: merchant, customer: customer).id

      get "/api/v1/invoices/#{id}"

      invoice = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(invoice[:id]).to eq(id)
    end
  end
end
