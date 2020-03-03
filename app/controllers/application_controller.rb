class ApplicationController < ActionController::Base
  include SessionsHelper

  private
    def check_admin
      unless current_user.is_admin?
        flash[:danger] = "You are not authorized."
        redirect_to root_url
      end
    end
end
