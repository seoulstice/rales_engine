class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
