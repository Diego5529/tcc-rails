class User < ActiveRecord::Base
  has_secure_password

  def editor?
    self.role == nil 
  end

  def admin?
    self.role == nil
  end
end