require './lib/station'

class DirectionGiver
	def initialize
		@stations = Station.list_stations
	end

	def transit_instructions(start, final)
		if start.get_my_line != final.get_my_line
			transfer_instructions(start,final)
		else
			direction = direction(start,final)
			number_of_stops = number_of_stops(start,final)
			instructions = "Get on the #{start.get_my_line} at #{start.get_my_name} and take the train #{direction} for #{number_of_stops} stops, getting off at #{final.get_my_name}."
			return instructions
		end
	end

	private

	def transfer_instructions(start,final)
		start1 = start
		start_line = start.get_my_line
		l_stop = Station.new("Sixth Avenue (14th Street)","L")
		f_stop = Station.new("14th Street (Sixth Avenue)", "F")

		case start_line
		when "L"
			transfer = l_stop
			start2 = f_stop
			direction1 = direction(start1, transfer)
			direction2 = direction(start2,final)
			stops1 = number_of_stops(start1, transfer)
			stops2 = number_of_stops(start2,final)
		when "F"
			transfer = f_stop
			start2 = l_stop
			direction1 = direction(start1, transfer)
			direction2 = direction(start2,final)
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

	def direction(start,final)
		start_line = start.get_my_line
		start_entry = get_station_for(start)
		final_entry = get_station_for(final)
		start_num = get_key_for(start_entry)
		final_num = get_key_for(final_entry)

		@direction = case start_line
		when "L"
			start_num < final_num ? "towards Manhattan" : "towards Brooklyn"
		when "F"
			final_num > start_num ? "uptown" : "downtown"
		else
			nil
		end
	end

	def number_of_stops(start,final)
		start_entry = get_station_for(start)
		final_entry = get_station_for(final)
		start_num = get_key_for(start_entry)
		final_num = get_key_for(final_entry)
		@num_of_stops = final_num > start_num ? final_num - start_num : start_num - final_num
	end

end