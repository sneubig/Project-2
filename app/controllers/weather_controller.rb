class WeatherController < ApplicationController
  def index
  	if user_signed_in?
  		@user = User.find_by(id: current_user.id)
  		@user.find_temp
  	end
  end
end
