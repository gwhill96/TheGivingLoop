class CharityProfilesController < ApplicationController

  def show
    @charity_profile = CharityProfile.where(params[:user_id]).first
  end

end
