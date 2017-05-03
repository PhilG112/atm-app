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
    transaction = Transaction.new
    transaction.credits = amount
    transaction.debits = 0
    transaction.transaction_type = "credit"
    transaction.account_id = account
    transaction.save()
  end
  
  def self.debit_account(account, amount)
    transaction = Transaction.new
    transaction.debits = amount
    transaction.credits = 0
    transaction.transaction_type = "debit"
    transaction.account_id = account
    transaction.save()
  end
  

  def from_account_id
  end

  def to_account_id
  end

  def transfer_amount
  end
  
end

