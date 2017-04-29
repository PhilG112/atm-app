class Customer < ApplicationRecord
  belongs_to :bank
  has_many :accounts
  has_many :transactions, through: :accounts
end
