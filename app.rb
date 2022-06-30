require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models/count.rb'

before do
  if Count.all.size == 0
    Count.create(number: 0)
  end
  if Count.all.size == 1
    Count.create(number: 0)
  end
end

get '/' do
  @number1 = Count.find(1).number
  @number2 = Count.find(2).number
  
  @persent1 = Count.find(1).number * 100 / (Count.find(1).number + Count.find(2).number)
  @persent2 = Count.find(2).number * 100 / (Count.find(1).number + Count.find(2).number)
  erb :index
end

post '/plus1' do
  count = Count.find(1)
  count.number = count.number + 1
  count.save
  redirect '/'
end

post '/plus2' do
  count = Count.find(2)
  count.number = count.number + 1
  count.save
  redirect '/'
end