require "rails_helper"

describe "Merchants API" do
  context "HTTP GET for merchant items" do
    before :each do
      @merchant1 = create(:merchant)
      @merchant2 = create(:merchant)
      @merchant3 = create(:merchant)

      item1 = create(:item, merchant: @merchant1)
      item2 = create(:item, merchant: @merchant2)
      item3 = create(:item, merchant: @merchant3)

      create(:invoice_item, item: item1, quantity: 50)
      create(:invoice_item, item: item2, quantity: 25)
      create(:invoice_item, item: item3, quantity: 5)
    end

    it "returns the top X merchants ranked by items sold" do
      get '/api/v1/merchants/most_items?quantity=2'

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants.count).to eq(2)
      # binding.pry
      expect(merchants[0][:id]).to eq(@merchant1.id)
    end
  end
end
