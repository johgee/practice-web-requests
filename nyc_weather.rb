require "http"

puts "Welcome to my weather app!"

while true
  puts "Enter a City or Quit"

  input = gets.chomp

  puts "Fahrenheit or Celsius? or Quit"

  input2 = gets.chomp
  if input2 == "Fahrenheit"
    input2 = "imperial"
  elsif input2 == "Celsius"
    input2 = "metric"
  elsif input == "Quit" || input2 == "Quit"
    break
  else
    puts "that is not valid"
  end

  request = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{input}&units=#{input2}&appid=#{ENV["OPEN_WEATHER_API_KEY"]}")

  # pp request

  weather_data = JSON.parse(request.body)

  temp = weather_data["main"]["temp"]
  description = weather_data["weather"][0]["description"]

  puts "Today it's #{temp} degrees and #{description}"
end
