class UsersController < ApplicationController
  before_action :set_user, :set_profile

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      flash[:notice] = "User profile updated successfully!"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Failed to update profile!"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_profile
    @profile = @user&.profile || @user.create_profile
  end

  def profile_params
    params.require("profile").permit(:first_name, :last_name, :address, :state, :pin_code, :timezone, :avatar)
  end
end
