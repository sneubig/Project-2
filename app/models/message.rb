class Message

  def set_time
    @@time = -5
  end

  def send_messages(time)
    hot_message(time)
    cold_message(time)
    windy_message(time)
    rainy_message(time)
  end


  #Condition messages
  def hot_message(time)
    users = User.where(hot: true, timezone: time)
    users.each do |x|
      send_message(x, "Dress cool! It's #{x.max_temp.to_i - x.prev_max_temp.to_i} degrees hotter than yesterday!")
      x.hot = false
      x.save
    end
  end

  def cold_message(time)
    users = User.where(cold: true, timezone: time)
    users.each do |x|
      send_message(x, "Dress warm! It's #{x.prev_min_temp.to_i - x.min_temp.to_i} degrees colder than yesterday!")
      x.cold = false
      x.save
    end
  end

  def windy_message(time)
    users = User.where(wind: "Strong Wind", timezone: time)
    users.each do |x|
      send_message(x, "It's pretty windy. Don't bring an umbrella, it might fly away!")
    end
  end

  def rainy_message(time)
    users = User.where(desc: "rainy", timezone: time)
    users.each do |x|
      send_message(users, "It's raining! Bring an umbrella!")
    end
  end

  def test_message
    users = User.where(email: "brandonjyuhas@gmail.com")
    send_message(x, "Testestestest")
  end

  #Find movies using the Rotten Tomatos API
  def sunny_movies_message

    address = URI("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/opening.json?apikey=" + "Rails.application.secrets.tomato_key")
    http = Net::HTTP.new address.host, address.port
    request = Net::HTTP::Get.new address.request_uri
    response = http.request(request)
    result = JSON.parse(response.body)
    #puts result
    movies = result["movies"]

    chosenMovies = []

    movies.each do |movie|
      if movie["ratings"]["critics_score"] > 70
        chosenMovies.push(movie)
      end
    end

    movies_text = ""
    chosenMovies.each do |movie|
      @movies_text += movie
    end

    @showTimes = "http://www.fandango.com/"
    movies_text_body = "#{@movies_text}#{@showTimes}#{zipcode}_movietimes?q=#{zipcode}"

    users = User.where(desc: "clear")
    users.each do |x|
      send_message(x, movies_text_body)
    end
  end

  def send_message(user, text)
    require 'rubygems'
    require 'twilio-ruby'

    number = "+1#{user.cell}"
    text_body = text

    account_sid = "AC7326a501d955b4b8090071e6d4d7ea1f"
    auth_token = "9e23410ee016bc59488c7d79e7a2c9df"

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(
      :body =>  text_body,
      :to => number,
      :from => "+12027514370"
      )
  end
end