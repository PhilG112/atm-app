class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.integer :customer_number
      t.text :first_name
      t.text :last_name
      t.text :contact_number
      t.integer :tfn

      t.timestamps
    end
  end
end
