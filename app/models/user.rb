class User < ActiveRecord::Base
	require 'HTTParty'

	after_create :find_long_lat
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def find_long_lat
  	raw_data = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{self.zipcode}&key=#{Rails.application.secrets.google_api_key}")
  	self.longitude = raw_data["results"][0]["geometry"]["location"]["lng"]
  	self.latitude = raw_data["results"][0]["geometry"]["location"]["lat"]
  	self.save
  end

  def find_weather
  	raw_data = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?lat=#{self.latitude}&lon=#{self.longitude}")

    ##Saves previous temp as yesterday's current temp
    self.prev_min_temp = self.min_temp
    self.prev_max_temp = self.max_temp

    ##current temp translated from kelvin / saved
  	self.min_temp = (9/5) * (raw_data["main"]["temp_min"].to_f - 273) + 32
    self.max_temp = (9/5) * (raw_data["main"]["temp_max"].to_f - 273) + 32  

    self.save
  end 

  def compare_weather
    if self.prev_min_temp - self.min_temp > 10
      return puts "Put on more yoga pants"
    else self.prev_max_temp - self.max_temp < 10
      return puts "Take off your sweatshirt"
    end
  end
end


