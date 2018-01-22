require 'csv'

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
