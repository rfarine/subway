require './stations'

class UserInterrogator
	def initialize
		@stations = Stations.list_stations
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
			start = @stations[ss]
			puts start.join(" on the ")
		else
			start = nil
			puts "I can't find your starting station."
		end
		return start
	end

	def get_final_station!
		puts "Which station # are you ending your journey?"
		fs = gets.chomp	
		if @stations.include?(fs) then
			final = @stations[fs]
			puts final.join(" on the ")
		else
			final = nil
			puts "I can't find your final station."
		end
		return final
	end

	def give_directions(start, final)
		puts "Start at: #{start} and get off at #{final}."
	end
end