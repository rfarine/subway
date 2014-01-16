require 'user_interrogator'

describe 'UserInterrogator' do

	subject { UserInterrogator.new }

	it 'should initialize with a hash of stations' do
		stations = Station.list_stations
		stations.should_not be_nil
	end

	describe 'display_station_list!' do
		it { subject.should respond_to(:display_station_list!) }
	end

	describe 'get_starting_station!' do
		it { subject.should respond_to(:get_starting_station!) }
	end

	describe 'get_final_station!' do
		it { subject.should respond_to(:get_final_station!) }
	end

	describe 'direction_to_ride_on_l(start,final)' do
		it { subject.should respond_to(:direction_to_ride_on_l).with(2).argument }
	end

	describe 'direction_to_ride_on_f(start,final)' do
		it { subject.should respond_to(:direction_to_ride_on_f).with(2).argument }
	end

	describe 'give_directions(start,final,direction,number_of_stops)' do
		it { subject.should respond_to(:give_directions).with(4).argument }
	end

	describe 'number_of_stops(start,final)' do
		it { subject.should respond_to(:number_of_stops).with(2).argument }
	end
end