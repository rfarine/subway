require 'direction_giver'

describe 'DirectionGiver' do

	subject { DirectionGiver.new }

	# List of Stations
	let(:station_list) { Station.list_stations }
	# L stops
	let(:lorimer) { Station.new("Lorimer Street", "L") }
	let(:eighth_ave) { Station.new("Eighth Avenue", "L") }
	let(:sixth_ave) { Station.new("Sixth Avenue (14th Street)", "L") }	
	# F stops
	let(:second_ave) { Station.new("Second Avenue", "F") }
	let(:west_fourth) { Station.new("West Fourth Street", "F") }

	it 'should initialize' do
		station_list.should_not be_nil
	end

	describe '## transit_instructions(start, final)' do
		it { subject.should respond_to(:transit_instructions).with(2).argument }
		it 'should return instructions for Lorimer Street to Eighth Avenue' do
			subject.transit_instructions(lorimer,eighth_ave).should eq("Get on the L at Lorimer Street and take the train towards Manhattan for 6 stops, getting off at Eighth Avenue.")
		end

		it 'should return instructions for Lorimer Street to Sixth Avenue (14th Street)' do
			subject.transit_instructions(lorimer,sixth_ave).should eq("Get on the L at Lorimer Street and take the train towards Manhattan for 5 stops, getting off at Sixth Avenue (14th Street).")
		end

		it 'should call #transfer_instructions if there is a transfer' do
			subject.should_receive(:transfer_instructions).with(lorimer,second_ave).and_return("Get on the L at Lorimer Street and take the train towards Manhattan for 5 stops and get off at Sixth Avenue (14th Street). Then, get on the F at 14th Street (Sixth Avenue), ride the train downtown for 3 stops and get off at Second Avenue.")
			subject.send(:transfer_instructions,lorimer,second_ave).should eq("Get on the L at Lorimer Street and take the train towards Manhattan for 5 stops and get off at Sixth Avenue (14th Street). Then, get on the F at 14th Street (Sixth Avenue), ride the train downtown for 3 stops and get off at Second Avenue.")
		end
	end

	describe '## direction(start,final)' do
		it 'should direct the user towards Manhattan' do
			subject.send(:direction,lorimer,eighth_ave).should eq("towards Manhattan")
		end

		it 'should direct the user towards Brooklyn' do 
			subject.send(:direction,eighth_ave,lorimer).should eq("towards Brooklyn")
		end

		it 'should direct the user uptown' do
			subject.send(:direction,second_ave,west_fourth).should eq("uptown")
		end

		it 'should direct the user downtown' do
			subject.send(:direction,west_fourth,second_ave).should eq("downtown")
		end
	end

	describe '## number_of_stops(start,final)' do

		it 'should return 0' do
			subject.send(:number_of_stops, lorimer, lorimer).should eq(0)
		end

		it 'should return 6' do
			subject.send(:number_of_stops, lorimer, eighth_ave).should eq(6)
		end

	end


end