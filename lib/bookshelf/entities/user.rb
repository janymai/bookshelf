require 'lotus/entity'
require 'bcrypt'

class User
  include Lotus::Entity
  include BCrypt

  attributes :name, :email, :password_digest

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(password)
    @password = Password.create(password)
    self.password_digest = @password
  end
end
