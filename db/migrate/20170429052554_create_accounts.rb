class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.decimal :balance
      t.integer :account_number
      t.text :description
      t.boolean :is_open
      t.integer :customer_id
      t.timestamps
    end
  end
end
