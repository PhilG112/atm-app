class AccountsController < ApplicationController
  before_action :authorise
  before_action :check_account_state, only: [:show]

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
    account = Account.new(account_params_new())
    # TODO: Make account_number unique
    account.account_number = Random.rand(100..10000)
    account.is_open = true
    account.customer = @current_user
    account.save()
    redirect_to(customer_account_path(@current_user, account))
  end

  def edit
    @account = Account.find_by(id: params["id"])
  end
  
  def update
    account = Account.find_by(id: params["id"])
    account.update(account_params_edit())
    redirect_to(customer_account_path(@current_user, account))
  end
  
  def destroy
    account = Account.find_by(id: params["id"])
    account.is_open = false
    account.save()
    redirect_to(customer_accounts_path())
  end

  private
  def account_params_new
    params.require(:account).permit(:description, :balance)
  end

  def account_params_edit
    params.require(:account).permit(:description)
  end

  def authorise
    if(!@current_user)
      flash[:error] = "You need to login to access that page."
      redirect_to("/")
    end
  end

  def check_account_state
    account = Account.find_by(id: params["id"])
    if(!account.is_open)
      flash[:error] = "That account is closed."
      redirect_to(customer_accounts_path(@current_user, account))
    end
  end
  
end
