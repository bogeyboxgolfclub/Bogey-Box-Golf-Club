class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:preference_submission]

  def show
    @user = User.find(params[:id])
    @title = "#{@user.first_name}'s Membership Profile]"
  end

  def preference_submission
    Preference.filter_preferences(params)
  end

end
