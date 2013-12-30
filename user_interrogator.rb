class UserInterrogator
	def display_station_list!
		stations = {
			"1" => ["Grand Street", "L"], ### L stations start
			"2" => ["Graham Avenue", "L"],
			"3" => ["Lorimer Street", "L"],
			"4" => ["Bedford Avenue", "L"],
			"5" => ["First Avenue", "L"],
			"6" => ["Third Avenue", "L"],
			"7" => ["14th Street/Union Square", "L"],
			"8" => ["Sixth Avenue (14th Street)", "L"], ## This is where they intersect
			"9" => ["Eighth Avenue", "L"],

			"10" => ["Second Avenue", "F"], ### F stations start
			"11" => ["Broadway-Lafayette Street", "F"],
			"12" => ["West Fourth Street", "F"],
			"13" => ["14th Street (Sixth Avenue)", "F"], ## This is where they intersect
			"14" => ["23rd Street", "F"],
			"15" => ["34th Street-Herald Square", "F"],
			"16" => ["42nd Street-Bryant Park", "F"],
			"17" => ["47-50 Streets-Rockefeller Center", "F"],
			"18" => ["57th Street", "F"]
		}

		stations.each do |key, value|
			puts "#{key} : #{value.join(" on the ")}"
		end
	end	

	def get_starting_station!
		puts "Which station # are you starting your journey?"
		ss = gets.chomp	
		session = UserInterrogator.new
		stations = session.display_station_list!
		start = if stations.include?(ss) then
			start = stations[ss]
			puts start.join(" on the ")
		else
			puts "I can't seem to find your starting destination. Sucks for you."
		end
	end

	def get_final_station!
		puts "Which station # are you ending your journey?"
		fs = gets.chomp	
		session = UserInterrogator.new
		stations = session.display_station_list!
		final = if stations.include?(fs) then
			final = stations[fs]
			puts final.join(" on the ")
		else
			puts "I can't seem to find your final destination. Sucks for you."
		end
	end
end