class CustomersController < ApplicationController
  # def initialize
    
  # end

  def index
    @customers = Customer.all()
  end

  def show
    account = Account.new
    @customer = Customer.find_by(id: params["id"])
    @accounts = @customer.accounts.all
    @balance = account.account_balance
  end

  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.create(customer_params())
    redirect_to(customer_path(customer))
  end

  def edit
    @customer = Customer.find_by(id: params["id"])
  end

  def update
    customer = Customer.find_by(id: params["id"])
    customer.update(customer_params())
    redirect_to(customer_path(customer))
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :tfn, :bank_id)
  end
end
