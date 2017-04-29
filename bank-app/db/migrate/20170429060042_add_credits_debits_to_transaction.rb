class AddCreditsDebitsToTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :credits, :decimal
    add_column :transactions, :debits, :decimal
  end
end
