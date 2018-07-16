require 'spec_helper'

describe 'Openweather API test' do

  context 'testing the single city weather service' do

    before(:all) do
      @city = OpenweatherAPI.new.single_city_weather
      @city.get_response
    end

    it 'should return a weather array' do
      expect(@city.get_weather).to be_a Array
    end

    it 'should return a cod of 200 as an integer' do
      expect(@city.get_cod).to eql 200
      expect(@city.get_cod).to be_a Integer
    end

    it 'should return a coords hash with the longitude and latitude of London' do
      expect(@city.get_coords).to be_a Hash
      expect(@city.get_coords).to contain_exactly(["lat",51.51],["lon",-0.13])
    end

    it 'should return lon and lat as floats within -180 to 180' do
      expect(@city.get_lon).to be_between(-180,180)
      expect(@city.get_lat).to be_between(-180,180)
      expect(@city.get_lon).to be_a Float
      expect(@city.get_lat).to be_a Float
    end

    it 'should return a main hash' do
      expect(@city.get_main).to be_a Hash
    end

    it 'should return a min & max temperature as a float with temp between those bounds' do
      expect(@city.get_min_temp).to be_a Float
      expect(@city.get_max_temp).to be_a Float
      expect(@city.get_temp).to be_a Float
      expect(@city.get_temp).to be_between(@city.get_min_temp,@city.get_max_temp)
      expect(@city.get_min_temp..@city.get_max_temp).to cover(@city.get_temp)
    end

  end

end
