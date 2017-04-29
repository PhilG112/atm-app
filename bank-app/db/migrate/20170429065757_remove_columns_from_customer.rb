class RemoveColumnsFromCustomer < ActiveRecord::Migration[5.0]
  def change
    remove_column :customers, :customer_number, :integer
    remove_column :customers, :contact_number, :text
  end
end
