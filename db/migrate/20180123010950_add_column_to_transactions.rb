class AddColumnToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :credit_card_expiration_date, :datetime
  end
end
