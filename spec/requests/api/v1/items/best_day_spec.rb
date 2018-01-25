require 'rails_helper'

describe "Item Best Day API" do
  context "HTTP GET" do
    it "returns the best sale date for an Item" do
      item = create(:item)

      invoice1 = create(:invoice, created_at: "2012-03-22 08:54:10 UTC")
      invoice2 = create(:invoice, created_at: "2012-03-22 08:54:10 UTC")
      invoice3 = create(:invoice, created_at: "2012-03-19 13:54:10 UTC")
      invoice4 = create(:invoice, created_at: "2012-03-19 13:54:10 UTC")

      invoice_item1 = create(:invoice_item, item: item, invoice: invoice1)
      invoice_item2 = create(:invoice_item, item: item, invoice: invoice2)
      invoice_item4 = create(:invoice_item, item: item, invoice: invoice3)
      invoice_item5 = create(:invoice_item, item: item, invoice: invoice4)


      get "/api/v1/items/#{item.id}/best_day"

      expect(response).to be_success

      days = JSON.parse(response.body, symbolize_names: true)

      expect(days[:best_day]).to eq("2012-03-22T08:54:10.000Z")
    end
  end
end
