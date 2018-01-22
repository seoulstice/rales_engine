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
