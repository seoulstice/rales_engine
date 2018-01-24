require 'rails_helper'

describe "Invoice Search API" do
  context "HTTP GET" do
    it "returns single invoice by customer_id parameter" do
      invoice = create(:invoice)
      invoice2 = create(:invoice)

      get "/api/v1/invoices/find?name=#{invoice.customer_id}"

      expect(response).to be_success

      invoice_response = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_response[:id]).to eq(invoice.id)
    end
    it "returns single invoice by update_at parameter" do
      invoice = create(:invoice)
      invoice2 = create(:invoice)

      get "/api/v1/invoices/find?created_at=#{invoice.updated_at}"

      expect(response).to be_success

      invoice_response = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_response[:id]).to eq(invoice.id)
    end
    it "returns all invoices by name parameter" do
      invoice = create(:invoice)
      invoice2 = create(:invoice)

      get "/api/v1/invoices/find_all?name=#{invoice.status}"

      expect(response).to be_success

      invoice_response = JSON.parse(response.body, symbolize_names: true)

      expect(invoice_response[0][:id]).to eq(invoice.id)
      expect(invoice_response[1][:id]).to eq(invoice2.id)
    end
  end
end
