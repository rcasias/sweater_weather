require 'securerandom'

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password

  before_create do
    self.api_key = SecureRandom.hex
  end

# private
#
#   def generate_api_key
#     self.api_key = SecureRandom.hex
#   end
end
