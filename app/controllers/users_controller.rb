class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @preferences = @user.preference
    @title = "#{@user.first_name}'s Membership Profile]"
  end

end
