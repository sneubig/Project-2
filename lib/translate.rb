module Translate
	def wind_speed(speed)
  	case speed
  	when 1...6
  		"Calm"
  	when 6...12
  		"Light Air"
  	when 12...20
  		"Light Breeze"
  	when 20...29
  		"Gentle Breeze"
  	when 29...39
  		"Moderate Breeze"
  	when 39...49
  		"Fresh Breeze"
  	when 49...74
  		"Strong Wind"
  	when 74...117
  		"Gale"
  	when 117...140
  		"Hurricane"
  	else
  		"Tornado"
  	end
  end

  def main_desc(main, desc)
  	case main
  	when 200..210
      return "Light Thunderstorm"
    when 211
      return "Thunderstorm"
    when 212..232
    	return "Heavy Thunderstorm"
    when 300..321
    	return "Drizzle"
    when 500
      return "Light Rain"
    when 501
      return "Rain"
    when 502..504
      return "Heavy Rain"
    when 511
      return "Freezing Rain"
    when 520..531
      return "Shower"
    when 600
      return "Light Snow"
    when 601..622
      return "Snow"
    else
      return desc
    end
  end
end