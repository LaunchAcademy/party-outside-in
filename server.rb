require 'sinatra'
require "sinatra/reloader" if development?
require "pry" if development? || test?
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  redirect '/parties'
end

get '/parties' do
  @parties = Party.all
  erb :'parties/index'
end

get '/parties/new' do
  @party = Party.new(params[:party])
  erb :'parties/new'
end

get '/parties/:id' do
  @party = Party.find(params[:id])
  erb :'parties/show'
end

post '/parties' do
  @party = Party.new(params[:party])
  if @party.save
    flash[:notice] = "Party added"
    redirect "/parties"
  else
    erb :'parties/new'
  end
end
