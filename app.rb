require "sinatra"
enable :sessions

get '/' do
  erb :pizza
end


post '/piz_results' do
	session[:size] = params[:size]
	session[:crust] = params[:crust]
	session[:topping] = params[:topping]
	session[:veg] = params[:veg]
	session[:addr] = params[:addr]
	redirect '/confirmation'
end	

get '/confirmation' do
	erb :confirmation, locals:{size: session[:size], crust: session[:crust], topping: session[:topping], veg: session[:veg], addr: [:addr]}
end	

post '/resultsroute' do
	topping = params[:topping]
	erb :resultsroute
	redirect '/results?topping=' + topping
end

get '/results' do
	topping = params[:topping]
	erb :results, :locals => {:topping=>topping}
end	

