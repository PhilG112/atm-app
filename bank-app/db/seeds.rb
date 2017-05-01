require 'customer'
Bank.destroy_all()

anz = Bank.create({
  name: "ANZ Bank",
  address: "Sydney CBD",
  abn: "abn12345",
})

Customer.destroy_all()

cust1 = Customer.create({
  first_name: "Phil",
  last_name: "Grujovski",
  tfn: "tfn123456789",
  bank_id: anz.id
})

puts "The bank is #{anz.name}, and the customer is #{cust1.first_name} #{cust1.last_name}"

Account.destroy_all()

acc1 = Account.create({
  balance: 500.0,
  account_number: 00001,
  description: "The account of phil",
  is_open: true,
  customer_id: cust1.id
})

puts "Customers bank is #{cust1.bank.name}"
puts "The banks customers are #{anz.customers.first.first_name}"
puts "#{cust1.first_name} account balance is #{cust1.accounts.first.balance}"
puts "The account #{acc1.account_number} belongs to #{acc1.customer.first_name}"


Transaction.destroy_all()

transaction1 = Transaction.create({
 transaction_type: "Debit",
 debits: 400.0,
 credits: 5000,
 account_id: acc1.id
})

transaction2 = Transaction.create({
  transaction_type: "Debit",
  debits: 500.0,
  credits: 1000.0,
  account_id: acc1.id
})

puts "transaction1 #{transaction1.transaction_type}"

puts "THE CUSTOMER HAS #{cust1.transactions.first.transaction_type}"

# debits = Transaction.sum(:debits)
# credits =  Transaction.sum(:credits)

# t = Account.new(500.0)

# puts t.account_balance

# Account.create({
#     balance: 500.0,
#     account_number: 1234,
#     description: "acc2",
#     is_open: true,
#     customer_id: 35
# })

# cust = Customer.find_by(id: 35)
# accs = cust.accounts.all
# accs.each do |a|
#   puts a.id
# end
