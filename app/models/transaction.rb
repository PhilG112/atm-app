class Transaction < ApplicationRecord
  belongs_to :account

  def initial_credit(acc)
    self.transaction_type = "debit"
    self.account_id = acc.id
    self.credits = 0
    self.debits = acc.balance
    return self
  end

  def from_account_id
  end

  def to_account_id
  end

  def transfer_amount
  end
  
end

