require 'spec_helper'

describe 'Openweather API test' do

  context 'testing the single location UV index' do

    before(:all) do
      @uv = OpenweatherAPI.new.single_uv
      @uv.get_response
    end

    it 'should return a hash' do
      expect(@uv.get_response).to be_a Hash
      expect(@uv.get_response).to include("lat", "lon", "date_iso", "date", "value")
    end

    it 'should return latitude and longitude as an integer within -180 to 180' do
      expect(@uv.get_lat).to be_a Integer
      expect(@uv.get_lon).to be_a Integer
      expect(@uv.get_lon).to be_between(-180,180)
      expect(@uv.get_lat).to be_between(-180,180)
    end

    it 'should return a date_iso as a date/time string' do
      expect(@uv.get_d_iso).to be_a String
      expect(@uv.get_d_iso).to include("2018", "T", "Z")
    end

    it 'should return a date integer' do
      expect(@uv.get_date).to be_a Integer
    end

    it 'should return a uv index value float between 0 and 10' do
      expect(@uv.get_value).to be_a Float
      expect(@uv.get_value).to be_between(0,10)
    end

  end

end
