class Verify < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.verify.verifyUser.subject
  #
  def verifyUser(user)
    @User= user
    mail to: @User.email, subject: 'Welcome to Swaptricks'
  end
end
