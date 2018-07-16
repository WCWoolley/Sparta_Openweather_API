require 'httparty'
require 'json'
require 'faker'

class SingleUV

  include HTTParty

  base_uri 'api.openweathermap.org/data/2.5/uvi?appid='

  def initialize
    @api_key = '17622957777e3d2ff0e3de1ae9020b1a'
  end

  def get_response
    @uv = JSON.parse(self.class.get("#{@api_key}&lat=45&lon=45").body)
  end

  def print_result
    puts @uv
  end

  def get_lat
    @uv['lat']
  end

  def get_lon
    @uv['lon']
  end

  def get_d_iso
    @uv['date_iso']
  end

  def get_date
    @uv['date']
  end

  def get_value
    @uv['value']
  end


end
