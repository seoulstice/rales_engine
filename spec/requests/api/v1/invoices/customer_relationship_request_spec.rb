require 'rails_helper'

require 'rails_helper'

describe "Invoice-Customer Relationship API" do
  context "HTTP GET" do
    it "returns all customer associated to single Invoice" do
      customer = create(:customer, first_name: "John", last_name: "Doe")
      invoice = create(:invoice, customer: customer)

      get "/api/v1/invoices/#{invoice.id}/customer"

      expect(response).to be_success

      customer1 = JSON.parse(response.body, symbolize_names: true)

      expect(customer1[:id]).to eq(customer.id)
      expect(customer1[:first_name]).to eq("John")
      expect(customer1[:last_name]).to eq("Doe")
    end
  end
end
