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

  #Here we can define variables based on the different data 
  #we will want in the text_body below

  require 'rubygems'         
  require 'twilio-ruby'

  users = User.all
  
  #Loop through user data to get the data you want for the text
  users.each do |user|
    #Format user cell to work with Twilio
    number = "+1#{user.cell}"
    text_body = "Hey there"

    @client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    message = @client.account.messages.create(
      :body =>  text_body,
      :to => number,
      :from => "+12027514370"
      ) 
  end
