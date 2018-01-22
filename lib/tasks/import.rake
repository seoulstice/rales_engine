require 'csv'

desc "Import Customer CSV"
task import_customer: :environment do
  file = 'db/customers.csv'
  CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
    Customer.create {row.to_hash}
  end
end

desc "Import Invoice Items CSV"
task import_invoice_items: :environment do
  file = 'db/invoice_items.csv'
  CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
    InvoiceItem.create {row.to_hash}
  end
end

desc "Import Invoices CSV"
task import_invoices: :environment do
  file = 'db/invoices.csv'
  CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
    Invoice.create {row.to_hash}
  end
end

desc "Import Items CSV"
task import_items: :environment do
  file = 'db/items.csv'
  CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
    Item.create {row.to_hash}
  end
end

desc "Import Merchants CSV"
task import_merchants: :environment do
  file = 'db/merchants.csv'
  CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
    Merchant.create {row.to_hash}
  end
end

desc "Import Transactions CSV"
task import_transactions: :environment do
  file = 'db/transactions.csv'
  CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
    Transaction.create {row.to_hash}
  end
end
task import_all: :environment do
  Rake::Task["import_customer"].invoke
  Rake::Task["import_invoice_items"].invoke
  Rake::Task["import_invoices"].invoke
  Rake::Task["import_items"].invoke
  Rake::Task["import_merchants"].invoke
  Rake::Task["import_transactions"].invoke
end
