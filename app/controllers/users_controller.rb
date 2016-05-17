class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @title = "#{@user.first_name}'s Membership Profile]"
  end

end
