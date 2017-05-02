class AddBankIdToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :bank_id, :integer
  end
end
