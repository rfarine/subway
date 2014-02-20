require 'station'

describe 'Station' do

	describe '## intitialize(name="Grand Street", line="L")' do
		it 'should initialize' do
			station = Station.new
			station.should_not be_nil
		end

		it 'should initialize with L as the default train line' do
			station = Station.new
			station.line.should eq('L')
		end

		it 'should initialize with Grand Street as the default station name' do
			station = Station.new
			station.name.should eq('Grand Street')
		end
	end

	describe '## name' do
		it 'should retrieve station name initialized in parameters' do
			station = Station.new('Graham Avenue', 'L')
			station.name.should eq('Graham Avenue')
		end
	end

	describe '## line' do
		it 'should return train line initialized in parameters' do
			station = Station.new("Second Avenue", "F")
			station.line.should eq('F')
		end
	end

end