require 'csv'

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
