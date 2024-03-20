class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :warning

    def authorize_admin
        redirect_back fallback_location: home_url unless current_user.admin?
    end

    def authorize_client
        redirect_back fallback_location: home_url unless current_user.admin? || current_user.client?
    end

    def authorize_technician
        redirect_back fallback_location: home_url unless current_user.admin? || current_user.technician?
    end
end