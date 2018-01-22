require 'csv'

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
