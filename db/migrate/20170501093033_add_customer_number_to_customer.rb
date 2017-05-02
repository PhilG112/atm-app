class AddCustomerNumberToCustomer < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :customer_number, :integer
  end
end
