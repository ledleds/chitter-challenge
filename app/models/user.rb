require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password, String
end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
