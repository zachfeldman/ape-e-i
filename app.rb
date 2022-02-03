require 'sinatra'

APES = File.open('apes.txt').read.split("\n\n---\n\n").map do |ape|
  {name: ape.split("\n")[0].split(": ")[1], photo: ape.split("\n")[1].split(": ")[1]}
end

get '/' do
  erb :ape_index
end