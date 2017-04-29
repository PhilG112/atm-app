class Account < ApplicationRecord
  belongs_to :customer
  has_many :transactions
end
