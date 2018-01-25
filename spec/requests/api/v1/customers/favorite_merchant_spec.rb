require 'rails_helper'

describe "Customers API" do
  context "HTTP GET" do
    it "returns the favorite merchant for a single customer" do
      customer = create(:customer)

      merchant1 = create(:merchant)
      merchant2 = create(:merchant)

      invoice1 = create(:invoice, customer: customer, merchant: merchant1)
      invoice2 = create(:invoice, customer: customer, merchant: merchant2)

      create(:transaction, invoice: invoice1, result: "success")
      create(:transaction, invoice: invoice1, result: "success")
      create(:transaction, invoice: invoice1, result: "success")
      create(:transaction, invoice: invoice1, result: "failed")
      create(:transaction, invoice: invoice2, result: "success")
      create(:transaction, invoice: invoice2, result: "failed")

      get "/api/v1/customers/#{customer.id}/favorite_merchant"

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:id]).to eq(merchant1.id)
    end
  end
end
