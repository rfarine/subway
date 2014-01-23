require './lib/station'

class DirectionGiver
	def initialize
		@stations = Station.list_stations
	end

	def transit_instructions(start, final)

		if start.get_my_line == "L" && final.get_my_line == "L"
			direction = direction_on_l(start,final)
		elsif start.get_my_line == "F" && final.get_my_line == "F"
			direction = direction_on_f(start,final)
		else
			direction = nil
			raise "You're trying to transfer and I'm just not prepared."
		end

		number_of_stops = number_of_stops(start,final)

		instructions = "Get on the #{start.get_my_line} at #{start.get_my_name} and take the train #{direction} for #{number_of_stops} stops, getting off at #{final.get_my_name}."

		return instructions
	end

	def transfer_instructions(start,final)

		start_line_1 = start.get_my_line # Line to get on first
		start_name_1 = start.get_my_name # Stop to get on first
		final_name_2 = final.get_my_name # Final stop to get off at

		case start_line_1
		when "L"
			start_station = Station.new(start_name_1,start_line_1)
			transfer_station = Station.new("Sixth Avenue (14th Street)","F")
			start_line_2 = "F" # Line to transfer to
			transfer_name = "Sixth Avenue (14th Street)" # Transfer station
			start_name_2 = "14th Street (Sixth Avenue)"
			start_station_2 = Station.new(start_name_2, start_line_2)
			direction_1 = direction_on_l(start_station, transfer_station) # Direction to ride L to transfer station
			direction_2 = direction_on_f(start_station_2,final)
			number_of_stops_1 = number_of_stops(start_station, transfer_station)
			number_of_stops_2 = number_of_stops(start_station_2,final)
		when "F"
			start_station = Station.new(start_name_1,start_line_1)
			transfer_station = Station.new("14th Street (Sixth Avenue)", "L")
			start_line_2 = "L" # Line to transfer to
			transfer_name = "14th Street (Sixth Avenue)"
			start_name_2 = "Sixth Avenue (14th Street)"
			start_station_2 = Station.new(start_name_2, start_line_2)
			direction_1 = direction_on_f(start_station, transfer_station) # Direction to ride L to transfer station
			direction_2 = direction_on_l(start_station_2,final)
			number_of_stops_1 = number_of_stops(start_station, transfer_station)
			number_of_stops_2 = number_of_stops(start_station_2,final)
		else
			raise
		end

		instructions = "Get on the #{start_line_1} at #{start_name_1} and take the train #{direction_1} for #{number_of_stops_1} stops and get off at #{transfer_name}. Then, get on the #{start_line_2} at #{start_name_2}, ride the train #{direction_2} for #{number_of_stops_2} stops and get off at #{final_name_2}."
		return instructions
	end

	private

	def direction_on_l(start,final)
		# find entry in hash for start and final stops
		start_entry = @stations.select { |number,stop| stop[0] == start.get_my_name }
		final_entry = @stations.select { |number,stop| stop[0] == final.get_my_name }
		start_num = start_entry.keys.to_s
		final_num = final_entry.keys.to_s
		if start_num < final_num
			@l_direction = "towards Manhattan"
		elsif start_num > final_num
			@l_direction = "towards Brooklyn"
		else
			@l_direction = nil
			raise "Stay still. You ain't movin."
		end
		return @l_direction
	end

	def direction_on_f(start,final)
		start_entry = @stations.select { |number,stop| stop[0] == start.get_my_name }
		final_entry = @stations.select { |number,stop| stop[0] == final.get_my_name }
		start_num = start_entry.keys.first.to_s.to_i
		final_num = final_entry.keys.first.to_s.to_i
		if final_num > start_num
			@f_direction = "uptown"
		elsif final_num < start_num
			@f_direction = "downtown"
		else
			@f_direction = nil
			raise "Stay still. You ain't movin."
		end
		return @f_direction
	end

	def number_of_stops(start,final)
		start_entry = @stations.select { |number,stop| stop[0] == start.get_my_name }
		final_entry = @stations.select { |number,stop| stop[0] == final.get_my_name }
		start_num = start_entry.keys.first.to_s.to_i
		final_num = final_entry.keys.first.to_s.to_i
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