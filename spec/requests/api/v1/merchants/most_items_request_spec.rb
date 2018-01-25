require "rails_helper"

describe "Merchants API" do
  context "HTTP GET for merchant items" do
    before :each do
      @merchant1 = create(:merchant)
      @merchant2 = create(:merchant)
      @merchant3 = create(:merchant)

      invoice1 = create(:invoice, merchant: @merchant1)
      invoice2 = create(:invoice, merchant: @merchant2)
      invoice3 = create(:invoice, merchant: @merchant3)

      create(:invoice_item, invoice: invoice1, quantity: 50)
      create(:invoice_item, invoice: invoice2, quantity: 25)
      create(:invoice_item, invoice: invoice3, quantity: 5)

      create(:transaction, invoice: invoice1, result: "success")
      create(:transaction, invoice: invoice2, result: "success")
      create(:transaction, invoice: invoice3, result: "success")
    end

    it "returns the top X merchants ranked by items sold" do
      get '/api/v1/merchants/most_items?quantity=2'

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)
      expect(merchants.count).to eq(2)

      expect(merchants[0][:id]).to eq(@merchant1.id)
    end
  end
end
