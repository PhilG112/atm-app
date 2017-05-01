class SessionController < ApplicationController
  def new
  end

  def create
    email = params["email"]
    password = params["password"]
    customer = Customer.find_by(email: email)

    if(customer.present? && customer.authenticate(password))
      session[:customer_id] = customer.id
      redirect_to(customer_path(session[:customer_id]))
    else
      flash[:login_error] = "The password or email was incorrect. Try again."
      render :new
    end
  end

  def destroy
    session[:customer_id] = nil
    redirect_to("/login")
  end
end
