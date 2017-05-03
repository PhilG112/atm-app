class Customer < ApplicationRecord
  belongs_to :bank, optional: true
  has_many :accounts
  has_many :transactions, through: :accounts
  has_secure_password

  def self.starting_account 
    10000
  end
end
