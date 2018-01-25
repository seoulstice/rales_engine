require 'rails_helper'

describe "Customer Invoices API" do
  context "HTTP GET" do
    it "returns invoices for a customer" do
      customer1 = create(:customer)
      customer2 = create(:customer)
      invoice1 = create(:invoice, customer: customer1)
      invoice2 = create(:invoice, customer: customer2)
      invoice3 = create(:invoice, customer: customer2)

      get "/api/v1/customers/#{customer2.id}/invoices"

      expect(response).to be_successful

      invoices = JSON.parse(response.body, symbolize_names: true)

      expect(invoices[0][:id]).to eq(invoice2.id)
      expect(invoices[1][:id]).to eq(invoice3.id)
    end
  end
end
