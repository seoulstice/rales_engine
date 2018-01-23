require 'rails_helper'

describe "Customer API" do
  context "HTTP GET with Name Query" do
    it "returns single Customer by name search" do
      customer1, customer2 = create_list(:customer, 2)

      get "/api/v1/customers/find?name=#{customer1.name}"

      expect(response).to be_successful

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(customer[:id]).to eq(customer1.id)
    end

    it "returns multiple Customers by name search" do
      customer1, customer2, customer3, customer4 = create_list(:customer, 4)

      get "/api/v1/customers/find_all?name=#{customer1.name}"

      expect(response).to be_successful

      customers = JSON.parse(response.body)

      expect(customers.count).to eq(1)
      expect(customers.class).to eq(Array)
    end
  end

  # context "HTTP"
end
