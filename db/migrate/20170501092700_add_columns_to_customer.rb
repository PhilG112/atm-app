class AddColumnsToCustomer < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :email, :text
    add_column :customers, :phone_number, :text

  end
end
