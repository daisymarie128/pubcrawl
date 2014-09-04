class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://fierce-river-3029.herokuapp.com/#login'
    mail(to: @user.email, subject: 'Welcome to Our Shitty Titty Site')
  end
end
