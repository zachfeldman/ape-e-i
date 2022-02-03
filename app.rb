require 'sinatra'
require 'json'
require 'pry'

def read_apes
  JSON.parse(File.open('apes.json').read)
end

get '/' do
  erb :ape_index
end


get '/apes/:ape_number' do
  @ape = read_apes[params[:ape_number].to_i - 1]
  erb :ape_show
end

put '/apes/:ape_number' do
  ape_file = read_apes
  ape_file[params[:ape_number].to_i - 1]['name'] = params[:name]
  ape_file[params[:ape_number].to_i - 1]['photo'] = params[:photo]
  File.write('apes.json', ape_file.to_json)
  redirect '/'
end

post '/apes' do
  ape_file = read_apes
  ape_count = ape_file.length
  ape_file[ape_count] = {}
  ape_file[ape_count][:name] = params[:name]
  ape_file[ape_count][:photo] = params[:photo]
  File.write('apes.json', ape_file.to_json)
  redirect '/'
end