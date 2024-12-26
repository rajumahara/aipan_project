class AuthController < ActionController::Base
  allow_browser versions: :modern

  include Authentication
  before_action :redirect_if_signed_in

  layout "auth_layout"
end
