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

	describe '## direction_on_l(start,final)' do
		it { subject.should respond_to(:direction_on_l).with(2).argument }

		it 'should direct the user towards Manhattan' do
			subject.direction_on_l(lorimer,eighth_ave).should eq("towards Manhattan")
		end

		it 'should direct the user towards Brooklyn' do
			subject.direction_on_l(eighth_ave,lorimer).should eq("towards Brooklyn")
		end

		it 'should raise an error, because they used identical starting and final stops' do
			lambda {
				subject.direction_on_l(eighth_ave,eighth_ave)
			}.should raise_error
		end
	end

	describe '## direction_on_f(start,final)' do
		it { subject.should respond_to(:direction_on_f).with(2).argument }

		it 'should direct the user uptown' do
			subject.direction_on_f(second_ave,west_fourth).should eq("uptown")
		end

		it 'should direct the user downtown' do
			subject.direction_on_f(west_fourth,second_ave).should eq("downtown")
		end

		it 'should raise an error, because they used identical starting and final stops' do
			lambda {
				subject.direction_on_f(west_fourth,west_fourth)
			}.should raise_error
		end
	end


	describe '## transit_instructions(start, final)' do
		it 'should return instructions for lorimer to 8th ave' do
			subject.transit_instructions(lorimer,eighth_ave).should eq("Get on the L at Lorimer Street and take the train towards Manhattan for 6 stops, getting off at Eighth Avenue.")
		end

		it 'should return instructions for lorimer to 6th ave' do
			subject.transit_instructions(lorimer,sixth_ave).should eq("Get on the L at Lorimer Street and take the train towards Manhattan for 5 stops, getting off at Sixth Avenue (14th Street).")
		end
	end

	describe '## give_directions(start,final,direction,number_of_stops)' do
		it { subject.should respond_to(:give_directions).with(4).argument }

		it 'should give directions on the L from Lorimer to 8th Ave, with 6 stops' do
			direction = subject.direction_on_l(lorimer,eighth_ave)
			num_of_stops = subject.number_of_stops(lorimer,eighth_ave)
			subject.should_receive(:give_directions).and_return("Get on the L at Lorimer Street and take the train towards Manhattan for 6 stops, getting off at Eighth Avenue.")
			subject.give_directions(lorimer,eighth_ave,direction,num_of_stops).should eq("Get on the L at Lorimer Street and take the train towards Manhattan for 6 stops, getting off at Eighth Avenue.")
		end

		it 'should give directions on the F from Second Ave to West Fourth, with 2 stops' do
			direction = subject.direction_on_f(second_ave,west_fourth)
			num_of_stops = subject.number_of_stops(second_ave,west_fourth)
			subject.should_receive(:give_directions).and_return("Get on the F at Second Avenue and take the train uptown for 2 stops, getting off at West Fourth Street.")
			subject.give_directions(second_ave,west_fourth,direction,num_of_stops).should eq("Get on the F at Second Avenue and take the train uptown for 2 stops, getting off at West Fourth Street.")
		end

		it 'should raise an error if no train ride is necessary' do
			direction = nil
			num_of_stops = 0
			lambda {
				subject.give_directions(lorimer,lorimer,direction,num_of_stops)
			}.should raise_error
		end
	end 

	describe '## number_of_stops(start,final)' do
		it { subject.should respond_to(:number_of_stops).with(2).argument }

		it 'should return 0' do
			subject.number_of_stops(lorimer,lorimer).should eq(0)
		end

		it 'should return 6' do
			subject.number_of_stops(lorimer,eighth_ave).should eq(6)
		end

	end

end