class User < ActiveRecord::Base
  #Username validations: Unique!, Can't be blank, 4 is the minimun characters.
  validates :username, :presence => true, :uniqueness => true, :length => {minimun: 4}
  #Password validations: Can't be blank, 8 is the minimun characters
  validates :password, :presence => true, :length => {minimun: 8}
  #Fistname validations: Can't be blank
  validates :firstname, :presence => true
  
end
