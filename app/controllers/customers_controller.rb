class CustomersController < ApplicationController
  before_action :check_if_logged_out, only: [:new, :create]
  before_action :check_if_logged_in, only: [:edit, :update, :show]

  def show
    @customer = Customer.find_by(id: params["id"])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params())
    @customer.bank_id = Bank.first.id
    # TODO: Make customer_number unique
    @customer.customer_number = Random.rand(1000..10000)
    if(@customer.save)
      session[:user_id] = @customer.id
      redirect_to(customer_path(@customer))
    else
      render :new
    end
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
    params.require(:customer).permit(:first_name, :last_name,
                                     :tfn, :phone_number, :email,
                                     :password, :password_confirmation)
  end

  def check_if_logged_out
    if(@current_user)
      flash[:error] = "You are already logged in."
      redirect_to(customer_path(session[:customer_id]))
    end
  end

  def check_if_logged_in
    if(!@current_user)
      flash[:error] = "You need to be logged in."
      redirect_to("/login")
    end
  end

end