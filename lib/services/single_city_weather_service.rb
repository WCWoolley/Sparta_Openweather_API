require 'httparty'
require 'json'
require 'faker'

class SingleCityWeather

  include HTTParty

  base_uri 'api.openweathermap.org/data/2.5/weather?q='

  def initialize
    @api_key = '17622957777e3d2ff0e3de1ae9020b1a'
  end

  def get_response
    @city = JSON.parse(self.class.get("London&appid=#{@api_key}").body)
  end

  def print_result
    puts @city
  end

  def get_weather
    @city['weather']
  end

  def get_cod
    @city['cod']
  end

  def get_coords
    @city['coord']
  end

  def get_lon
    get_coords['lon']
  end

  def get_lat
    get_coords['lat']
  end

  def get_main
    @city['main']
  end

  def get_min_temp
    get_main['temp_min']
  end

  def get_max_temp
    get_main['temp_max']
  end

  def get_temp
    get_main['temp']
  end

end
