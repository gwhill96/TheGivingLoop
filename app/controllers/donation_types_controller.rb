class DonationTypesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # THIS IS THE CODE WHERE THE BASKET IS BEING INSTANTIATED - NOT IN BASKET CONTROLLER
    @donationtypes = DonationType.all
    @basket_item = BasketItem.new
    basket_id = session[:basket_id]
    @basket = Basket.find_by(id: basket_id)
    @user = current_user
    if @basket.nil?
      @basket = Basket.new
      @basket.user = current_user if current_user
      session[:basket_id] = @basket.id if @basket.save
    end
    if current_user.charity
      @charity_profile = CharityProfile.find(@user.id)
    end
  end

  # def show
  #   authorize @donationtype
  #   # user = current_user
  #   # charity = CharityProfile.find(user.id)
  #   @donationtype = DonationType.find(params[:id])
  # end

  def new
    @donationtype = DonationType.new
    authorize @donationtype
  end

  def create
    authorize @donationtype
    @donationtype = DonationType.new(donationtype_params)
    if @donationtype.save!
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @donationtype = DonationType.find(params[:charity_profile_id])
    authorize @donationtype
  end

  def update
    authorize @donationtype
    @donationtype = DonationType.find(params[:id])
    @donationtype.update(donationtype_params)
    redirect_to donationtype_path(@donationtype)
  end

  def destroy
    authorize @donationtype
    @donationtype = DonationType.find(params[:id])
    @donationtype.destroy
    redirect_to user_path(current_user), status: :see_other
  end

  private

  def donationtype_params
    params.require(:donationtype).permit(:name, :price)
  end

  # def guest_token
  #   session[:guest_token] ||= SecureRandom.uuid
  # end
end
