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
  		"Gresh Breeze"
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

  def main_desc(main)
  	case main
  	when "Clouds"
      return "cloudy"
    when "Clear"
      return "clear"
    when "Rain"
    	return "rainy"
    when "Drizzle"
    	return "drizzling"
    else
      return main.downcase
    end
  end
end