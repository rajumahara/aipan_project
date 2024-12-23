class PasswordResetsController < ApplicationController
  before_action :redirect_if_signed_in

  def new
  end

  def create
    if user = User.find_by(email: params[:email])
      redirect_to root_path, notice: "Email invitation Send!"
    else
      redirect_to root_path, notice: "No user found!"
    end
  end

  def edit
  end

  def update
  end
end
