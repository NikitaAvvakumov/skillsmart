class CustomersController < ApplicationController
  before_action :set_customer
  before_action :authenticate_user!
  before_action :authorize_customer!, except: [:show]

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render 'edit'
    end
  end

  def destroy
    @customer.destroy
    redirect_to root_url
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name)
  end

  def authorize_customer!
    redirect_to root_url unless current_customer == @customer
  end
end
