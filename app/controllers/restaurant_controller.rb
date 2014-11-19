
class RestaurantController < ApplicationController

  def index
  	require 'ordrin'

  	api = Ordrin::APIs.new("G9JOnscz9pwlSmFneYG_Ke0YIyD8RHcmPRJercNAMWE", :test)

  	# @address = Ordrin::Data::Address.new('500 E Cesar Chavez St', 'Austin', 'TX', '78701', '555-555-5555')

  	street = params[:street_address]
  	city = params[:city]
  	state = params[:state]
  	zip = params[:zip]
  	phone = params[:phone]

  	@address = street + ", " + city + ", " + zip

  	args = {:datetime => "ASAP",:addr => street, :city => city, :zip => zip}
  	puts args

  	@delivery_list = api.delivery_list(args)

  	puts @delivery_list
  	puts @delivery_list.count

    render :json => @delivery_list
  end

  def show

  	require 'ordrin'
  	api = Ordrin::APIs.new("G9JOnscz9pwlSmFneYG_Ke0YIyD8RHcmPRJercNAMWE", :test)

  	args = {:rid => params["format"]}

  	puts ("params " + args.to_s)

  	@restaurant = api.restaurant_details(args)

  	puts @restaurant

  	@menu = @restaurant["menu"]

  end
end
