class UserMailer < ApplicationMailer

  default from: ENV['GMAIL_USERNAME']

  def send_password(user)
    @password = user.password
    @user = user
    mail(to: @user.email, subject: 'Contraseña de Usuario Sistema de Registro')
  end
end
