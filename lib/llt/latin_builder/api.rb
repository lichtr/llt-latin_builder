require 'sinatra'
require 'llt/latin_builder'
before do
#  content_type :txt
  @x = LLT::LatinBuilder.new
  'Starting Latin Builder'
end

get '/create' do
#    require 'pry'; binding.pry
  result = String.new
  @x.create_sentence(:random).build.each do |elem|
     result << elem.to_s << ' '
  end
  result
end

