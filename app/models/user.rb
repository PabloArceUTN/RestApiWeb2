require 'securerandom'
class User < ActiveRecord::Base
  has_secure_password
  #This should be executed before a new user record will stored in the DB
  before_create :set_token
  #I don f**kin  know what is this shit for
  #attr_accessor :password_digest
  #Username validations: Unique!, Can't be blank, 4 is the minimun characters.
  validates :username, :presence => true, :uniqueness => true
  #Password validations: Can't be blank, 8 is the minimun characters
  #validates :password, :presence => true, :length => { :in => 8..20 }
  #Fistname validations: Can't be blank
  validates :firstname, :presence => true

  #Get new token
  def self.get_new_token
    User.new.instance_eval do
      return generate_auth_token
    end
  end

  private
  def set_token
    return if token.present?
    self.token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end
end
