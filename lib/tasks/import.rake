require 'csv'

desc "Import Customer CSV"
task import: :environment do
  file = 'db/customers.csv'
  CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
    Customer.create {
      first_name: row[:first_name],
      last_name: row[:last_name],
      created_at: row[:created_at],
      updated_at: row[:updated_at]
    }
  end
end

desc "Import Invoice Items CSV"
task import: :environment do
  file = 'db/invoice_items.csv'
  CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
    InvoiceItem.create {
      item_id: row[:item_id],
      invoice_id: row[:invoice_id],
      quantity: row[:quantity],
      unit_price: row[:unit_price]
      created_at: row[:created_at],
      updated_at: row[:updated_at]
    }
  end
end

desc "Import Invoices CSV"
task import: :environment do
  file = 'db/invoices.csv'
  CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
    Invoice.create {
      customer_id: row[:customer_id],
      merchant_id: row[:merchant_id],
      status: row[:status],
      created_at: row[:created_at],
      updated_at: row[:updated_at]
    }
  end
end

desc "Import Items CSV"
task import: :environment do
  file = 'db/items.csv'
  CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
    Item.create {
      name: row[:name],
      description: row[:description],
      unit_price: row[:unit_price],
      merchant_id: row[:merchant_id],
      created_at: row[:created_at],
      updated_at: row[:updated_at]
    }
  end
end

desc "Import Merchants CSV"
task import: :environment do
  file = 'db/merchants.csv'
  CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
    Merchant.create {
      name: row[:name],
      created_at: row[:created_at],
      updated_at: row[:updated_at]
    }
  end
end

desc "Import Transactions CSV"
task import: :environment do
  file = 'db/transactions.csv'
  CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
    Transaction.create {
      invoice_id: row[:invoice_id],
      credit_card_number: row[:credit_card_number],
      credit_card_expiration_date: row[:credit_card_expiration_date],
      result: row[:result],
      created_at: row[:created_at],
      updated_at: row[:updated_at]
    }
  end
end
