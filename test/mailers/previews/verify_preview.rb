# Preview all emails at http://localhost:3000/rails/mailers/verify
class VerifyPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/verify/verifyUser
  def verifyUser
    Verify.verifyUser
  end

end
