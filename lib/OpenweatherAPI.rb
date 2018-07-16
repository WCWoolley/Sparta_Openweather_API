require_relative 'services/single_city_weather_service.rb'
require_relative 'services/single_UV_service.rb'
require_relative 'services/single_forecast_service.rb'

class OpenweatherAPI

  def single_city_weather
    SingleCityWeather.new
  end

  def single_uv
    SingleUV.new
  end

  def single_fc
    SingleForecast.new
  end

end

setup = OpenweatherAPI.new
city = setup.single_city_weather
uv = setup.single_uv
fc = setup.single_fc
fc.get_response
fc.print_result
