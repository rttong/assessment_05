class User < ActiveRecord::Base
  include BCrypt
  validates_presence_of :name, :email, :password, {:message => 'Missing required field.'}
  validates_uniqueness_of :email, {:message => 'Email must be unique.'}

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
  	@user = User.find_by_email(email)
  	@user if @user.password == password
  end
end
