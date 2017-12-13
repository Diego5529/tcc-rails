class UserMailer < ApplicationMailer
  default from: 'footwear.clickjogos@gmail.com'

  def welcome_email(user, email)
    @user = user
    @url  = 'localhost:3000/admin'
    if @user != nil
      email = @user.email
    end

    mail(to: email, subject: 'You have an new invitation')
  end
end