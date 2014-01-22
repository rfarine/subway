require './lib/station'

class DirectionGiver
	def initialize
		@stations = Station.list_stations
	end

	def transit_instructions(start, final)
		director = DirectionGiver.new

		if start.get_my_line == "L"
			direction = director.direction_on_l(start,final)
		elsif start.get_my_line == "F"
			direction = director.direction_on_f(start,final)
		else
			direction = "No direction."
		end

		number_of_stops = director.number_of_stops(start,final)

		instructions = "Get on the #{start.get_my_line} at #{start.get_my_name} and take the train #{direction} for #{number_of_stops} stops, getting off at #{final.get_my_name}."

		return instructions
	end

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

	def give_directions(start, final, direction, number_of_stops)
		# TODO: Rename method to transit_instructions
		if start != nil && final != nil && direction != nil && number_of_stops != 0
			start_stop = start.get_my_name
			final_stop = final.get_my_name
			start_line = start.get_my_line
			puts "Get on the #{start_line} at #{start_stop} and take the train #{direction} for #{number_of_stops} stops, getting off at #{final_stop}."
		else
			raise "You're not moving."
		end
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