class User < ActiveRecord::Base
  include BCrypt
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  
  validates :name, presence: true
  validates :email, presence: true
  validates :password, length: { in: 6..20 }, confirmation: true, presence: true
end


