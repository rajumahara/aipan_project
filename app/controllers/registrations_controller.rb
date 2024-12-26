class RegistrationsController < AuthController
  before_action :redirect_if_signed_in, only: [:new, :create]
  # layout "auth_layout"

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to dashboard_path, notice: "You have successfully registered!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
