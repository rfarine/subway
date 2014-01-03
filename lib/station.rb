class Station
	def self.list_stations
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
		return stations
	end
end