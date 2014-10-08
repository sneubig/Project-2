
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

<<<<<<< HEAD
  def test_message
    users = User.where(email: "brandonjyuhas@gmail.com")
    send_message(x, "Testestestest")
  end

  #Find movies using the Rotten Tomatos API
  def sunny_movies_message

    address = URI("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/opening.json?limit=16&country=us&apikey=" + "Rails.application.secrets.tomato_key")
    http = Net::HTTP.new address.host, address.port
    request = Net::HTTP::Get.new address.request_uri
    response = http.request(request)
    result = JSON.parse(response.body)
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

=======
>>>>>>> 5c1ae67860b17b8f17d33c8e603df2cf1ccdfceb
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