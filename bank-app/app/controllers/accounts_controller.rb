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
    account = Account.new(account_params())
    account.customer = @current_user
    account.save()
    redirect_to("customers/#{session[:customer_id]}/accounts/#{account.id}")
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end

  private
  def account_params
    params.require(:account).permit(:description, :balance)
  end
end
