class DashboardsController < ApplicationController
  before_action :require_authentication
  helper_method :current_user

  def show
  end

  private

  def current_user
    Current.user
  end
end
