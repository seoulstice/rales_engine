require 'rails_helper'

describe "Merchants API" do
  context "HTTP GET" do
    it "returns all merchants" do
      create_list(:merchant, 3)

      get '/api/v1/merchants'

      expect(response).to be_successful

      items = JSON.parse(response.body)

      expect(items.count).to eq(3)
    end
  end
end
