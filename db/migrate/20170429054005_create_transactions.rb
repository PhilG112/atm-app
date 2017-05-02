class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.text :transaction_type
      t.integer :account_id

      t.timestamps
    end
  end
end
