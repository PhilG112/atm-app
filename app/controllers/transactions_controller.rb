class TransactionsController < ApplicationController
  before_action :authorise

  def index
    customer = Customer.find_by(id: @current_user.id)
    @transactions = customer.transactions.all
  end

  def show
    @account = Account.find_by(id: params["id"])
    @transactions = @account.transactions.all
  end

  def new
    # TODO: Ask jack how to prevent closed accoutns form showing up in the collection_select
    @transaction = Transaction.new
  end

  def create
    # TODO: Check if from_account has enough money to perform the transaction
    from_account = params["transaction"]["from_account_id"].to_i
    to_account = params["transaction"]["to_account_id"].to_i
    amount = params["transaction"]["transfer_amount"].to_f
    Transaction.credit_account(from_account, amount)
    Transaction.debit_account(to_account, amount)
    flash[:transaction_outcome] = "Transaction Complete."
    redirect_to(customer_path(@current_user))
  end

  private
  def authorise
    if(!@current_user)
      flash[:error] = "You need to login to access that page."
      redirect_to(login_path())  
    end
    
  end
  
end