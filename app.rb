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
	redirect '/results'
end

get '/results' do
	erb :results, locals:{size: session[:size], crust: session[:crust], topping: session[:topping], veg: session[:veg], addr: [:addr]}
end	


