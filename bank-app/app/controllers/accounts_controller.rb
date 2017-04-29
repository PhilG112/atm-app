class AccountsController < ApplicationController
  def index
    @get_customer = Customer.find_by(id: params["customer_id"])
    @accounts = @get_customer.accounts.all
  end

  def show
    @account = Account.find_by(id: params["id"])
  end
end
