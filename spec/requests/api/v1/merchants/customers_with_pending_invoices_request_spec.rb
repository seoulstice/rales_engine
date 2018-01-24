require 'rails_helper'

describe "Customers with Pending Invoices API" do
  context "HTTP GET" do
    it "returns customers_with_pending_invoices for a single merchant" do
      merchant1 = create(:merchant)
      customer1, customer2, customer3 = create_list(:customer, 3)
      invoice1 = create(:invoice, merchant: merchant1, customer: customer1)
      invoice2 = create(:invoice, merchant: merchant1, customer: customer2)
      invoice3 = create(:invoice, merchant: merchant1, customer: customer3)
      create(:transaction, invoice: invoice1, result: 'failed')
      create(:transaction, invoice: invoice2, result: 'success')
      create(:transaction, invoice: invoice3, result: 'failed')

      get "/api/v1/merchants/#{merchant1.id}/customers_with_pending_invoices"

      expect(response).to be_successful

      customers = JSON.parse(response.body, symbolize_names: true)

      expect(customers[0][:id]).to eq(customer1.id)
      expect(customers[1][:id]).to eq(customer3.id)
    end
  end
end
