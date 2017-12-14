class UserMailer < ApplicationMailer
  default from: 'footwear.clickjogos@gmail.com'

  def welcome_email(user, email, event)
    @user = user
    @url  = 'http://localhost:3000/admin'
    @email = email
    @event = event
    if @user != nil
      @email = @user.email
    end

    mail(to: @email, subject: 'You have an new invitation')
  end
end