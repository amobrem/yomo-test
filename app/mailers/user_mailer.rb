class UserMailer < ActionMailer::Base
  default from: 'notifications@yomoments.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://yomoments.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end