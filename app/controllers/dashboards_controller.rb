class DashboardsController < ApplicationController
  # before_action :require_authentication
  helper_method :current_user
  # layout "auth_layout"

  def show
    @organizations = Organization.all.order(created_at: :desc)
  end

  private

  def current_user
    Current.user
  end
end
