require 'rails_helper'

describe "Merchants API" do
  context "HTTP GET with Name Query" do
    it "returns single Merchant by name search" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)

      get "/api/v1/merchants/find?name=#{merchant1.name}"

      expect(response).to be_successful

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant[:id]).to eq(merchant1.id)
    end

    it "returns multiple Merchants by name search" do
      merchant1, merchant2, merchant3, merchant4 = create_list(:merchant, 4)

      get "/api/v1/merchants/find_all?name=#{merchant1.name}"

      expect(response).to be_successful

      merchants = JSON.parse(response.body)

      expect(merchants.count).to eq(1)
      expect(merchants.class).to eq(Array)
    end
  end
end
