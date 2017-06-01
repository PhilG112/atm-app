class Transaction < ApplicationRecord
  belongs_to :account

  def self.initial_credit(acc)
    t = Transaction.new
    t.transaction_type = "debit"
    t.account_id = acc.id
    t.credits = 0
    t.debits = acc.balance
    t.save()
  end

  def self.credit_account(account, amount)
    t = Transaction.new
    t.credits = amount
    t.debits = 0
    t.transaction_type = "credit"
    t.account_id = account
    t.save()
  end
  
  def self.debit_account(account, amount)
    t = Transaction.new
    t.debits = amount
    t.credits = 0
    t.transaction_type = "debit"
    t.account_id = account
    t.save()
  end
  

  def from_account_id
  end

  def to_account_id
  end

  def transfer_amount
  end
  
end

