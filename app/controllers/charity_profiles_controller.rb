class CharityProfilesController < ApplicationController

  def show
    authorize @charity_profile
    @charity_profile = CharityProfile.where(params[:user_id]).first
  end

end
