require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather
    @street_address = params.fetch("user_street_address")
    url_safe_street_address = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the string @street_address.
    # A URL-safe version of the street address, with spaces and other illegal
    #   characters removed, is in the string url_safe_street_address.
    # ==========================================================================
    
    geocode_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_street_address}"
    parsed_geo_code_data = JSON.parse(open(geocode_url).read)
    latitude = parsed_geo_code_data.dig("results", 0, "geometry", "location", "lat")
    longitude = parsed_geo_code_data.dig("results", 0, "geometry", "location", "lng")

    @latitude = "#{latitude}"

    @longitude = "#{longitude}"
    
    weather_url = "https://api.darksky.net/forecast/848196edd7dfd537caff0d226f01049a/#{@latitude},#{@longitude}"
    parsed_weather_data = JSON.parse(open(weather_url).read)

    @current_temperature = "#{parsed_weather_data.dig("currently", "temperature")}"

    @current_summary = "#{parsed_weather_data.dig("currently", "summary")}"

    @summary_of_next_sixty_minutes = "#{parsed_weather_data.dig("minutely", "summary")}"

    @summary_of_next_several_hours = "#{parsed_weather_data.dig("hourly", "summary")}"

    @summary_of_next_several_days = "#{parsed_weather_data.dig("daily", "summary")}"

    render("meteorologist/street_to_weather.html.erb")
  end
end
