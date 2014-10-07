  #Here we can define variables based on the different data 
  #we will want in the text_body below
  
  def send_message
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
  end