require 'station'

describe 'Station' do
	it 'should initialize' do
		Station.new.should_not be_nil
	end

	it 'should initialize with train line' do
		station = Station.new(:line => 'L')
		station.get_my_line.should eq('L')
	end

	# it 'should initialize with station name' do
	# 	station = Station.new(:name => 'First Avenue')
	# 	station.get_my_name.should eq('First Avenue')
	# end
end