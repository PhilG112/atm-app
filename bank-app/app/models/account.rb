class Account < ApplicationRecord
  belongs_to :customer
  has_many :transactions

  def total_debits
    Transaction.sum(:debits)
  end

  def total_credits
    Transaction.sum(:credits)
  end

  def account_balance
    self.balance = total_debits - total_credits
  end
end
