class BasketsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_basket, only: %i[update show checkout]

  def create

    # THINK NONE OF THIS CODE IS BEING USED
    @basket = Basket.new
    @basket.user = current_user if current_user
    # @basket.guest_user = ? if current_user.nil?
    if @basket.save
      session[:basket_id] = @basket.id
      redirect_to @basket, notice: "Basket with id:#{@basket.id} was successfully created."
    else
      redirect_to root_path, alert: "Something wrong happened"
    end
  end

  def show
  end

  def update
    @basket.update(guest_user: guest_basket_params)
    flash[:notice] = "Your basket was successfully updated"
    redirect_to @basket
  end

  def checkout
    session[:basket_id] = nil
  end

  private

  def find_basket
    @basket = Basket.find(params[:id])
  end

  def guest_basket_params
    params.require(:guest_basket).permit(:email, :first_name, :last_name, :phone_number)
  end
end
