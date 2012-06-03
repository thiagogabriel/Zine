class User < ActiveRecord::Base
  attr_accessible :encoded_password, :login, :password
  validates_length_of :login, :within => 3..20
  validates_presence_of :encoded_password, :message => "can't be blank"
  validates_uniqueness_of :login
  
  def self.login(login, password)
    user = User.find_by_login login
    if user and user.encoded_password == Digest::SHA1.hexdigest("vbjsdgbndfb" + password)
      user
    else
      nil
    end
  end
  
  def password
    ""
  end
  
  def password=(new_password)
    if new_password.length > 0
      self.encoded_password = Digest::SHA1.hexdigest("vbjsdgbndfb" + new_password)
    else
      nil
    end
  end
end
