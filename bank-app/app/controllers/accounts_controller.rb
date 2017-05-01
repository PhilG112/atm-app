class AccountsController < ApplicationController
  def index
    @get_customer = Customer.find_by(id: params["customer_id"])
    @accounts = @get_customer.accounts.all
  end

  def show
    @account = Account.find_by(id: params["id"])
  end

  def new
    @account = Account.new
  end

  def create
    account = Account.create(account_params())
    redirect_to(customer_account_path(account))
  end

  def edit
  end
  
  def update
  end
  
  def destrory
  end

  private
  def account_params
    params.require(:account).permit(:description, :balance)
  end
end
