require 'rails_helper'

describe "Customers API" do
  context "HTTP GET" do
    it "returns all customers" do
      create_list(:customer, 3)

      get '/api/v1/customers'

      expect(response).to be_successful

      items = JSON.parse(response.body)

      expect(items.count).to eq(3)
    end

    it "returns one customer" do
      id = create(:customer).id

      get "/api/v1/customers/#{id}"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item[:id]).to eq(id)
    end
  end
end
