class UserMailer < ApplicationMailer
  def new_user_registration(user)
    @user = user
    @url = '/verify?code=' + user.auth_code
    mail(to: user.email, subject: 'Verify Your EMail Account')
  end
end
