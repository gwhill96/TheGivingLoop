class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # helper_method :current_user -- we will need to add this back in once we have overridden the devise log in
  # after_action :create_basket

  # private

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end - this is for when we override the devise log in to have guest checkout

  # this method will create a new basket on log in. we will need to change once we have the guest checkout

  # def create_basket
  #   Basket.create!(user_id: @current_user.id)
  # end
end
