class AddPasswordDigestToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :password_digest, :text
  end
end
