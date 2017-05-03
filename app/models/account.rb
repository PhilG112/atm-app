class Account < ApplicationRecord
  belongs_to :customer
  has_many :transactions
  
  def self.starting_account_number
    100000
  end
  

  def total_debits()
    self.transactions.all.sum(:debits)
  end
  
  def total_credits
    self.transactions.all.sum(:credits)
  end
  
  def account_balance
    self.balance = total_debits - total_credits
  end
end
