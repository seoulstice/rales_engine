require 'csv'

task import_all: :environment do
  Customer.destroy_all
  Merchant.destroy_all
  Invoice.destroy_all
  Item.destroy_all
  InvoiceItem.destroy_all
  Transaction.destroy_all

  file = 'db/customers.csv'
  CSV.foreach(file, headers: true) do |row|
    Customer.create!(row.to_hash)
  end

  file = 'db/merchants.csv'
  CSV.foreach(file, headers: true, header_converters: true) do |row|
    Merchant.create!(row.to_hash)
  end

  file = 'db/invoices.csv'
  CSV.foreach(file, headers: true, header_converters: true) do |row|
    Invoice.create!(row.to_hash)
  end

  file = 'db/items.csv'
  CSV.foreach(file, headers: true, header_converters: true) do |row|
    Item.create!(row.to_hash)
  end

  file = 'db/invoice_items.csv'
  CSV.foreach(file, headers: true, header_converters: true) do |row|
    InvoiceItem.create!(row.to_hash)
  end

  file = 'db/transactions.csv'
  CSV.foreach(file, headers: true, header_converters: true) do |row|
    Transaction.create!(row.to_hash)
  end
end
