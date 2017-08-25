require "sinatra"

get '/' do
  erb :pizza
end


post '/piz_results' do
	size = params[:size].to_s
	crust = params[:crust].to_s
	topping = params[:topping].to_s
	veg = params[:veg].to_s
	addr = params[:addr]
	erb :piz_results
	redirect '/confirmation?size=' + size + '&crust=' + crust + '&topping=' + topping + '&veg=' + veg + '&addr=' + addr
end	

get '/confirmation' do
	size = params[:size].split
	crust = params[:crust].split
	topping = params[:topping].split
	veg = params[:veg].split
	addr = params[:addr]
	erb :confirmation, :locals => {:size=>size, :crust=>crust, :topping=>topping, :veg=>veg, :addr=>addr}
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

