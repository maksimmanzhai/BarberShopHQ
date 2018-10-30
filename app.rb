#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db" #1. greate database

class Client < ActiveRecord::Base #2. greate model
	validates :name, presence: true, length: { minimum: 3 }
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
end

#3. rake db:create_migration NAME=name_of_migration

class Barber < ActiveRecord::Base #model
end

class Shop < ActiveRecord::Base #model
end

before do
	@barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
	@c = Client.new
	erb :visit
end

post '/visit' do
	@c = Client.new params[:client]
	
	if @c.save
		erb "<h2>Thanx, for you choice!</h2>"
	else 
		@error = @c.errors.full_messages.first
		erb :visit
	end

end