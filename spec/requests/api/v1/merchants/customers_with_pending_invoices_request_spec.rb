require 'rails_helper'

describe "Customers with Pending Invoices API" do
  context "HTTP GET" do
    it "returns customers_with_pending_invoices for a single merchant" do
      merchant1 = create(:merchant)
      customer1 = create(:customer)
      customer2 = create(:customer)
      customer3 = create(:customer)
      create(:invoice, merchant: merchant1, customer: customer1, status: "pending")
      create(:invoice, merchant: merchant1, customer: customer2)
      create(:invoice, merchant: merchant1, customer: customer3, status: "pending")

      get "/api/v1/merchants/#{merchant1.id}/customers_with_pending_invoices"

      expect(response).to be_successful

      customers = JSON.parse(response.body, symbolize_names: true)

      expect(customers[0][:id]).to eq(customer1.id)
      expect(customers[1][:id]).to eq(customer3.id)
    end
  end
end
