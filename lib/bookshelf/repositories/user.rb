require 'lotus/repository'

class UserRepository
  include Lotus::Repository

  def self.user(email, password)
    query do
      where(email: email, password_digest: password)
    end.first
  end
end
