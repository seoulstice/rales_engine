require 'csv'

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
