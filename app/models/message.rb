
class Message

  #Condition messages
  def hot_message
    users = User.where(hot: true)
    users.each do |x|
      send_message(x, "Dress cool! It's #{x.max_temp.to_i - x.prev_max_temp.to_i} degrees hotter than yesterday!")
    end
  end

  def cold_message
    users = User.where(cold: true)
    users.each do |x|
      send_message(x, "Dress warm! It's #{x.prev_min_temp.to_i - x.min_temp.to_i} degrees colder than yesterday!")
    end
  end

  def windy_message
    users = User.where(wind: "Strong Wind")
    users.each do |x|
      send_message(x, "It's pretty windy. Don't bring an umbrella, it might fly away!")
    end
  end

  def rainy_message
    users = User.where(desc: "rainy")
    users.each do |x|
      send_message(users, "It's raining! Bring an umbrella!")
    end
  end

  def send_message(user, text)
    require 'rubygems'
    require 'twilio-ruby'

    number = "+1#{user.cell}"
    text_body = text

    account_sid = Rails.application.secrets.twilio_account_sid
    auth_token = Rails.application.secrets.twilio_auth_token

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(
      :body =>  text_body,
      :to => number,
      :from => "+12027514370"
      )
  end
end