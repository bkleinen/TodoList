class User < ActiveRecord::Base
  has_many :todos
  acts_as_authentic do |config|
    # Add custom configuration options here
    config.crypto_provider = Authlogic::CryptoProviders::MD5
  end
end
