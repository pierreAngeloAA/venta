class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def create
    super do |resource|
      if params[:user][:name].present? && params[:user][:role].present? && resource.persisted?
        create_associated_profile(resource, params[:user][:name], params[:user][:role])
      end
    end
  end

  private

  def create_associated_profile(user, name, role)
    if role == 'client'
      entity = Client.create(user: user, name: name, email: user.email)
    elsif role == 'technician'
      entity = Technician.create(user: user, name: name, email: user.email)
    end

    UserMailer.welcome_new_user(entity).deliver_later
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
end
