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
		@start = if @stations.include?(ss)
			starting_station = @stations[ss]
			starting_station.each do |name,line|
				@name = starting_station[0]
				@line = starting_station[1]
			end
			Station.new(@name,@line)
		else
			raise "I can't find your starting station."
		end
	end

	def get_final_station!
		puts "Which station # are you ending your journey?"
		fs = gets.chomp	
		@final = if @stations.include?(fs) then
			final_station = @stations[fs]
			final_station.each do |name,line|
				@name = final_station[0]
				@line = final_station[1]
			end
			Station.new(@name,@line)
		else
			raise "I can't find your final station."
		end
	end
end