class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include Pundit::Authorization

  # Pundit: allow-list approach
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :phone_number])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end





  # helper_method :current_user -- we will need to add this back in once we have overridden the devise log in
  # after_action :create_basket

  # Warden::Manager.after_authentication do |user, auth, opts|
  #   auth.session[:basket_id] ||= Basket.create!.id
  # end

  # helper_method :current_basket

  # def after_database_authentication
  #   self.current_basket
  # end

  # def current_basket
  #   @current_basket ||= find_basket
  # end

  # private

  # def find_basket
  #   basket = Basket.find_by(id: session[:basket_id])
  #   if basket.blank?
  #     basket = Basket.create
  #   end
  #   session[:basket_id] = basket.id
  #   return basket
  # end

  # private

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end - this is for when we override the devise log in to have guest checkout

  # this method will create a new basket on log in. we will need to change once we have the guest checkout

  # def create_basket
  #   Basket.create!(user_id: @current_user.id)
  # end
