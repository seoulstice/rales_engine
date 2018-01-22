require 'csv'

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
