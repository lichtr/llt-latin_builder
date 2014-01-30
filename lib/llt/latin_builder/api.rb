require 'sinatra'
require 'llt/latin_builder'
class Api < Sinatra::Base
  configure do
    set :lb,  LLT::LatinBuilder.new
  end

  get '/create' do
    sentence = settings.lb.create_sentence(:random).build
    @sbj = sentence[0]
    @obj = sentence[1]
    @pred = sentence[2]
    erb :create
  end
end
Api.run!

