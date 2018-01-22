class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :unit_price
      t.integer :merchant_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
