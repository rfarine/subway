require 'station'

describe 'Station' do

	describe '## intitialize(name="Grand Street", line="L")' do
		it 'should initialize' do
			station = Station.new
			station.should_not be_nil
		end

		it 'should initialize with L as the default train line' do
			station = Station.new
			station.get_my_line.should eq('L')
		end

		it 'should initialize with Grand Street as the default station name' do
			station = Station.new
			station.get_my_name.should eq('Grand Street')
		end
	end

	describe '## get_my_name' do
		it 'should retrieve station name initialized in parameters' do
			station = Station.new('Graham Avenue', 'L')
			station.get_my_name.should eq('Graham Avenue')
		end
	end

	describe '## get_my_line' do
		it 'should return train line initialized in parameters' do
			station = Station.new("Second Avenue", "F")
			station.get_my_line.should eq('F')
		end
	end

end