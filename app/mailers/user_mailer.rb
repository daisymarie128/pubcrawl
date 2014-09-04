class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def confirmation_email(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Welcome to APP")
  end

  def welcome_email(user, login_url)
    @user = user
    @login_url = login_url
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Welcome to APP")
  end
end
