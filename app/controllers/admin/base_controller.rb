module Admin
  class BaseController < ApplicationController
    layout 'admin'

    before_action :authenticate_admin!

    private

    def authenticate_admin!
      redirect_to login_path unless current_user.present?
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end
end
