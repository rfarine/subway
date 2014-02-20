class Station
	def initialize(name="Grand Street", line="L")
		@name = name
		@line = line
	end

	def self.list_stations
		{
			"1" => ["Grand Street", "L"], ### L stations start
			"2" => ["Graham Avenue", "L"],
			"3" => ["Lorimer Street", "L"],
			"4" => ["Bedford Avenue", "L"],
			"5" => ["First Avenue", "L"],
			"6" => ["Third Avenue", "L"],
			"7" => ["14th Street/Union Square", "L"],
			"8" => ["Sixth Avenue (14th Street)", "L"], ## This is where F & L intersect
			"9" => ["Eighth Avenue", "L"],

			"10" => ["Second Avenue", "F"], ### F stations start
			"11" => ["Broadway-Lafayette Street", "F"],
			"12" => ["West Fourth Street", "F"],
			"13" => ["14th Street (Sixth Avenue)", "F"], ## This is where F & L intersect
			"14" => ["23rd Street", "F"],
			"15" => ["34th Street-Herald Square", "F"],
			"16" => ["42nd Street-Bryant Park", "F"],
			"17" => ["47-50 Streets-Rockefeller Center", "F"],
			"18" => ["57th Street", "F"],

			"19" => ["Greenpoint Avenue", "G"], ### G stations start
			"20" => ["Nassau Avenue", "G"],
			"21" => ["Metropolitan Avenue", "G"], ### This is where G & L intersect
			"22" => ["Broadway", "G"],
			"23" => ["Flushing Avenue", "G"],
			"24" => ["Myrtle-Willoughby Avenues", "G"],
			"25" => ["Bedford-Nostrand Avenues", "G"],
			"26" => ["Classon Avenue", "G"],
			"27" => ["Clinton-Washington Avenues", "G"]
		}
	end

	def get_my_line
		@line
	end

	def get_my_name
		@name
	end
end