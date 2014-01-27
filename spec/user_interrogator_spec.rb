require 'user_interrogator'

describe 'UserInterrogator' do

	subject { UserInterrogator.new }

	it 'should initialize with a hash of stations' do
		stations = Station.list_stations
		stations.should_not be_nil
	end

	describe '## display_station_list!' do
		it { subject.should respond_to(:display_station_list!) }
	end

	describe '## get_starting_station!' do
		it { subject.should respond_to(:get_starting_station!) }
	end

	describe '## get_final_station!' do
		it { subject.should respond_to(:get_final_station!) }
	end
end