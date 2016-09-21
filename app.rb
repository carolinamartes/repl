require 'rubygems'
require 'sinatra'

set :protection, :except => :frame_options

get '/' do
  erb :index
end

get '/iframe' do
  erb :iframe
end
