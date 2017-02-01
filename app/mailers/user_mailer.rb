class UserMailer < ApplicationMailer
	default from: 'glasgowpevsner@Guidemail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://glasgowarchitecture.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to Glasgow Pevsner Guide')
  end
end
