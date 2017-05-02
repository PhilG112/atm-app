class TransactionsController < ApplicationController
  # TODO: Setup Authorization for controller
  # TODO: Make sure customer cannot see transactinos for a closed account
  def index
    customer = Customer.find_by(id: @current_user.id)
    @transactions = customer.transactions.all
  end

  def show
    @account = Account.find_by(id: params["id"])
    @transactions = @account.transactions.all
  end

  def new
    # TODO: fix transactions between accounts
    @transaction = Transaction.new
  end

  def create
    raise "hell"
  end
  
end
