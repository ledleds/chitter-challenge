require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base

  ENV["RACK_ENV"] = 'development'

  get '/' do
    erb :index
  end

  get '/user' do
    User.create(email: params[:email],
    password: params[:password])
  end

  get '/user/new' do
    erb :sign_up
  end

  run! if app_file == $0
end
