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

	def direction_to_ride(start,final)
		start_station = start.get_my_name
		final_station = final.get_my_name
		start = @stations.invert[start_station]
		return start
	end


end