class UserMailer < ApplicationMailer

  def welcome_email(user, password)
    @user = user
    @password = password
    make_bootstrap_mail(to: @user.email, subject: 'Admin Access granted for Ironhorsestudio.net')
  end

end
