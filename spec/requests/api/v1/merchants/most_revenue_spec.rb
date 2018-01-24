require 'rails_helper'

describe "Merchants API" do
  context "HTTP GET with most_revenue query" do
    it "returns Merchant(s) with most revenue" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      merchant3 = create(:merchant)

      invoice1 = create(:invoice, merchant: merchant)


    end
  end
end
