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
    @transaction = Transaction.new
  end

  def create
    from_account = params["transaction"]["from_account_id"].to_i
    to_account = params["transaction"]["to_account_id"].to_i
    amount = params["transaction"]["transfer_amount"].to_f

    if(check_account_balance(from_account, amount))
      Transaction.credit_account(from_account, amount)
      Transaction.debit_account(to_account, amount)
      flash[:successful_transaction] = "Transaction Complete."
      redirect_to(customer_path(@current_user))
    else
      flash[:failed_transaction] = "From account has insufficent funds."
      @transaction = Transaction.new
      render :new
    end
  end

  private
  def authorise
    if(!@current_user)
      flash[:error] = "You need to login to access that page."
      redirect_to(login_path())  
    end
  end

  def check_account_balance(acc, amount)
    a = Account.find_by(id: acc)
    a.account_balance > amount
  end
end