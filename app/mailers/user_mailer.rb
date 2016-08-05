class UserMailer < ApplicationMailer
  default from: 'sergiy20101995@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://cryptic-tundra-49542.herokuapp.com/'
    # binding.pry
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end
end
