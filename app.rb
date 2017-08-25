require "sinatra"

get '/' do
  erb :pizza
end


post '/sand_results' do
	topping = params[:topping].to_s
	erb :sand_results
	redirect '/confirmation?topping=' + topping
end	

get '/confirmation' do
	topping = params[:topping].split
	erb :confirmation, :locals => {:topping=>topping}
end	

post '/resultsroute' do
	topping = params[:topping].to_s
	erb :resultsroute
	redirect '/results?topping=' + topping
end

get '/results' do
	topping = params[:topping].split
	erb :results, :locals => {:topping=>topping}
end	

