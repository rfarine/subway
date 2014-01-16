require './lib/station'

class UserInterrogator
	def initialize
		@stations = Station.list_stations
	end

	def display_station_list!
		@stations.each do |key, value|
			puts "#{key} : #{value.join(" on the ")}"
		end
	end	

	def get_starting_station!
		puts "Which station # are you starting your journey?"
		ss = gets.chomp	
		if @stations.include?(ss)
			starting_station = @stations[ss]
			starting_station.each do |name,line|
				@name = starting_station[0]
				@line = starting_station[1]
			end
			@start = Station.new(@name,@line)
		else
			@start = nil
			puts "I can't find your starting station."
		end
		return @start
	end

	def get_final_station!
		puts "Which station # are you ending your journey?"
		fs = gets.chomp	
		if @stations.include?(fs) then
			final_station = @stations[fs]
			final_station.each do |name,line|
				@name = final_station[0]
				@line = final_station[1]
			end
			@final = Station.new(@name,@line)
		else
			@final = nil
			puts "I can't find your final station."
		end
		return @final
	end

	def direction_to_ride_on_l(start,final)
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
			@l_direction = "Stay still. You ain't movin."
		end
		return @l_direction
	end

	def direction_to_ride_on_f(start,final)
		start_entry = @stations.select { |number,stop| stop[0] == start.get_my_name }
		final_entry = @stations.select { |number,stop| stop[0] == final.get_my_name }
		start_num = start_entry.keys.to_s
		final_num = final_entry.keys.to_s
		if final_num > start_num
			@f_direction = "uptown"
		elsif final_num < start_num
			@f_direction = "downtown"
		else
			@f_direction = "Stay still. You ain't movin."
		end
		return @f_direction
	end

	def give_directions(start, final, direction)
		start_stop = start.get_my_name
		final_stop = final.get_my_name
		start_line = start.get_my_line
		final_line = final.get_my_line
		puts "Get on the #{start_line} at #{start_stop} and take the train #{direction}, getting off at #{final_stop}."
	end


end