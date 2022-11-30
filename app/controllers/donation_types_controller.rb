class DonationTypesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :initialize_session
  before_action :increment_visit_count, only: :index

  def index
    # THIS IS THE CODE WHERE THE BASKET IS BEING INSTANTIATED - NOT IN BASKET CONTROLLER
    @donationtypes = DonationType.all
    @basket_item = BasketItem.new
    basket_id = session[:basket_id]
    if basket_id
      @basket = Basket.find(basket_id)
    else
      @basket = Basket.new
      @basket.user = current_user if current_user
      @basket.id = guest_token
    end
    # @basket.guest_user = ? if current_user.nil?
    if @basket.save
      session[:basket_id] = @basket.id
    end
  end

  def show
    @donationtype = DonationType.find(params[:id])
  end

  def new
    @donationtype = DonationType.new
  end

  def create
    @donationtype = DonationType.new(donationtype_params)
    if @donationtype.save!
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @donationtype = DonationType.find(params[:id])
  end

  def update
    @donationtype = DonationType.find(params[:id])
    @donationtype.update(donationtype_params)
    redirect_to donationtype_path(@donationtype)
  end

  def destroy
    @donationtype = DonationType.find(params[:id])
    @donationtype.destroy
    redirect_to user_path(current_user), status: :see_other
  end

  private

  def initialize_session
    session[:visit_count] ||= 0 # initialize the visit count on first visit
  end

  def increment_visit_count
    session[:visit_count] += 1 # increments the count with each visit
    @visit_count = session[:visit_count]
  end

  def donationtype_params
    params.require(:donationtype).permit(:name, :price)
  end

  def guest_token
    session[:guest_token] ||= SecureRandom.uuid
  end
end
