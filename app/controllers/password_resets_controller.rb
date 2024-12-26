class PasswordResetsController < AuthController
  before_action :redirect_if_signed_in

  def new
  end

  def create
    if user = User.find_by(email: params[:email])
      token = user.generate_token_for(:password_reset)
      p "my token is #{token}"
      UserMailer.with(user: user, password_reset_token: token).password_reset.deliver_now
      redirect_to root_path, notice: "Email invitation Send!"
    else
      flash.now[:notice] = "No user found!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    user = User.find_by_token_for(:password_reset, params[:password_reset_token])
    Rails.logger.info "my user: #{user.inspect}"

    if user.nil?
      flash.now[:notice] = "Invalid token!"
      render :edit, status: :unprocessable_entity
    elsif user.update(password_reset_params)
      flash.now[:notice] = "password reset successfully!"
      sign_in(user)
      redirect_to dashboard_path
    end
  end

  private

  def password_reset_params
    params.require(:password_reset).permit(:password, :password_reset_token)
  end
end
