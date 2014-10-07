
class Message
  
  #Condition messages
  def hot_message
    text = "Man it's hot out today!"
    send_message
  end

  def cold_message
    text = "Man it's cold today!"
    send_message
  end

  def windy_message
    text = "It's pretty windy. Don't bring an umbrella, it might fly away!"
  end


  #Find users that meet conditions
  User.where("hot" = true) do
    hot_message
  end

  User.where("cold" = true) do
    cold_message
  end

  User.where("wind" = "Strong wind" || "Gale" || "Hurricane" || "Tornado") do
    windy_message
  end

  def send_message(text)
    require 'rubygems'         
    require 'twilio-ruby'

    # users = User.all
    
    #Loop through user data to get the data you want for the text
    # users.each do |user|
      #Format user cell to work with Twilio
      number = "+17032315273"
      text_body = "Hey there"

      account_sid = Rails.application.secrets.twilio_account_sid
      auth_token = Rails.application.secrets.twilio_auth_token

      @client = Twilio::REST::Client.new account_sid, auth_token
      message = @client.account.messages.create(
        :body =>  text_body,
        :to => number,
        :from => "+12027514370"
        )
    end
  # end
end