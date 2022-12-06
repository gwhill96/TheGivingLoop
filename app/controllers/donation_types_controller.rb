class DonationTypesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # THIS IS THE CODE WHERE THE BASKET IS BEING INSTANTIATED - NOT IN BASKET CONTROLLER
    @donationtypes = DonationType.all
    @basket_item = BasketItem.new
    @charity_profile = CharityProfile.find(@user.id) if !@user.nil? && @user.charity
    basket_id = session[:basket_id]
    @unredeeemed_donations = BasketItem.includes(:basket, :donation_type).where(redeemed: false, baskets: { state: 'paid' })
    @basket = Basket.find_by(id: basket_id)
    if current_user.nil? || !current_user.charity
      @user = current_user unless current_user.nil?
      if @basket.nil?
        @basket = Basket.new
        @basket.user = current_user if current_user
        session[:basket_id] = @basket.id if @basket.save
      end
    else
      @user = current_user
      if @basket.nil?
        @basket = Basket.new
        @basket.user = @user
        session[:basket_id] = @basket.id if @basket.save
      end
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
end
