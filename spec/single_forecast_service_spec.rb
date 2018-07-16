require 'spec_helper'

describe 'Openweather API test' do

  context 'testing the single location 5 day weather forecast' do

    before(:all) do
      @fc = OpenweatherAPI.new.single_fc
      @fc.get_response
    end

    it 'should return a hash' do
      expect(@fc.get_response).to be_a Hash
    end

    it 'should return a cod of 200 as a string' do
      expect(@fc.get_cod).to eql "200"
      expect(@fc.get_cod).to be_a String
    end

    it 'should return a list of times array' do
      expect(@fc.get_list).to be_a Array
      @fc.get_list.each do |value|
        expect((value)['dt']).to be_a Integer
      end
    end

    it 'should return a weather array within each list element' do
      # @fc.get_list.each do |value|
      #   expect((value)['weather']).to be_a Array
      # end
      expect(@fc.get_weather).to be_a Array
    end

    it 'should return a description for each weather element as a string' do
      # expect(@fc.get_weather_description).to be_a String
      puts @fc.get_weather
    end

  end

end
