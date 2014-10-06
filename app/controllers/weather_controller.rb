class WeatherController < ApplicationController
  def index
  	if user_signed_in?
  		@weather = current_user.temp
  	end
  end
end
