class DonationTypesController < ApplicationController
  def index
    @donationtype = Donationtype.find(params[:id])
  end

  def show
    @donationtype = Donationtype.find(params[:id])
  end

  def new
    @donationtype = Donationtype.new
  end

  def create
    @donationtype = Donationtype.new(donationtype_params)
    if @donationtype.save!
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @donationtype = Donationtype.find(params[:id])
  end

  def update
    @donationtype = DonationType.find(params[:id])
    @donationtype.update(donationtype_params)
    redirect_to donationtype_path(@donationtype)
  end

  def destroy
    @donationtype = Donationtype.find(params[:id])
    @donationtype.destroy
    redirect_to user_path(current_user), status: :see_other
  end

  private

  def donationtype_params
    params.require(:donationtype).permit(:name, :price)
  end
end
