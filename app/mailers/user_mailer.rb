class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome_client
    @client = params[:client]
    @client_name = @client.name

    mail to: @client.user.email
  end
  def welcome_technician
    @technician = params[:technician]
    @technician_name = @technician.name

    mail to: @technician.user.email
  end
end
