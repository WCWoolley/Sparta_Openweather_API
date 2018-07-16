require 'httparty'
require 'json'
require 'faker'

class SingleForecast

  include HTTParty

  base_uri 'api.openweathermap.org/data/2.5/forecast?q='

  def initialize
    @api_key = '17622957777e3d2ff0e3de1ae9020b1a'
  end

  def get_response
    @fc = JSON.parse(self.class.get("London,us&mode=json&appid=#{@api_key}").body)
  end

  def print_result
    puts @fc
  end

  def get_cod
    @fc['cod']
  end

  def get_list
    @fc['list']
  end

  def get_weather
    get_list.each do |value|
      value['main']['weather']
    end
  end

  def get_weather_description
    get_list.each do |value|
      value['main']['weather']['description']
    end
  end

end
