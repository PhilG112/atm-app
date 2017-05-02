class CreateBanks < ActiveRecord::Migration[5.0]
  def change
    create_table :banks do |t|
      t.text :name
      t.text :address
      t.text :abn

      t.timestamps
    end
  end
end
