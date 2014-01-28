require './lib/station'

class DirectionGiver
	def initialize
		@stations = Station.list_stations
	end

	def transit_instructions(start, final)

		start_line = start.get_my_line
		final_line = final.get_my_line

		if start_line == "L" && final_line == "L"
			direction = direction_on_l(start,final)
			number_of_stops = number_of_stops(start,final)
			instructions = "Get on the #{start.get_my_line} at #{start.get_my_name} and take the train #{direction} for #{number_of_stops} stops, getting off at #{final.get_my_name}."
			return instructions
		elsif start_line == "F" && final_line == "F"
			direction = direction_on_f(start,final)
			number_of_stops = number_of_stops(start,final)
			instructions = "Get on the #{start.get_my_line} at #{start.get_my_name} and take the train #{direction} for #{number_of_stops} stops, getting off at #{final.get_my_name}."
			return instructions
		else
			transfer_instructions(start,final)
		end
	end

	private

	def transfer_instructions(start,final)

		# Start1 - Starting Station
		start1 = start
		# Start_line - Starting Line
		start_line = start.get_my_line

		case start_line
		when "L"
			transfer = Station.new("Sixth Avenue (14th Street)","F") # Transfer - First stop. Get off here to board next train.
			start2 = Station.new("14th Street (Sixth Avenue)", "F") # Start2 - Starting station for second train.

			direction1 = direction_on_l(start1, transfer) # Direction1 - Direction to ride L to transfer station
			direction2 = direction_on_f(start2,final) # Direction2 - Direction to ride F to final station
			
			stops1 = number_of_stops(start1, transfer) # Stops1 - Number of stops from starting station to transfer station
			stops2 = number_of_stops(start2,final) # Stops2 - Number of stops from second starting station (start2) to final station
		when "F"
			transfer = Station.new("14th Street (Sixth Avenue)", "L")
			start2 = Station.new("Sixth Avenue (14th Street)", "L")

			direction1 = direction_on_f(start1, transfer)
			direction2 = direction_on_l(start2,final)
			
			stops1 = number_of_stops(start1, transfer)
			stops2 = number_of_stops(start2,final)
		else
			return false
		end

		instructions = "Get on the #{start1.get_my_line} at #{start1.get_my_name} and take the train #{direction1} for #{stops1} stops and get off at #{transfer.get_my_name}. Then, get on the #{start2.get_my_line} at #{start2.get_my_name}, ride the train #{direction2} for #{stops2} stops and get off at #{final.get_my_name}."
		return instructions
	end

	def get_station_for(stop)
		@stations.select { |number,station| station[0] == stop.get_my_name }
	end

	def get_key_for(station)
		station.keys.first.to_s.to_i
	end

	def direction_on_l(start,final)
		start_entry = get_station_for(start)
		final_entry = get_station_for(final)
		start_num = get_key_for(start_entry)
		final_num = get_key_for(final_entry)
		if start_num < final_num
			@l_direction = "towards Manhattan"
		elsif start_num > final_num
			@l_direction = "towards Brooklyn"
		else
			@l_direction = nil
		end
		return @l_direction
	end

	def direction_on_f(start,final)
		start_entry = get_station_for(start)
		final_entry = get_station_for(final)
		start_num = get_key_for(start_entry)
		final_num = get_key_for(final_entry)
		if final_num > start_num
			@f_direction = "uptown"
		elsif final_num < start_num
			@f_direction = "downtown"
		else
			@f_direction = nil
		end
		return @f_direction
	end

	def number_of_stops(start,final)
		start_entry = get_station_for(start)
		final_entry = get_station_for(final)
		start_num = get_key_for(start_entry)
		final_num = get_key_for(final_entry)
		if final_num > start_num
			@num_of_stops = final_num - start_num
		elsif final_num < start_num
			@num_of_stops = start_num - final_num
		else
			@num_of_stops = 0
		end
		return @num_of_stops
	end

end