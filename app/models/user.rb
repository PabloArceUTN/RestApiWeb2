require 'securerandom'
class User < ActiveRecord::Base
  has_secure_password
  #This should be executed before a new user record will stored in the DB
  before_create :set_token
  #This executed before user record will saved
  #before_save :encrypt_password
  #This executed after user record will saved
  #after_save :clear_password
  #I don f**kin  know what is this shit for
  #attr_accessor :password_digest
  #Username validations: Unique!, Can't be blank, 4 is the minimun characters.
  validates :username, :presence => true, :uniqueness => true
  #Password validations: Can't be blank, 8 is the minimun characters
  validates :password, :presence => true, :length => { :in => 8..20 }
  #Fistname validations: Can't be blank
  validates :firstname, :presence => true
  private

  def set_token
    return if token.present?
    self.token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end

  # def encrypt_password
  #   if password.present?
  #     salt = BCrypt::Engine.generate_salt
  #     password = BCrypt::Engine.hash_secret(password, salt)
  #   end
  # end
  #
  # def clear_password
  #   self.password = nil
  # end

end
