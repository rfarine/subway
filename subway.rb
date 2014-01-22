require './lib/user_interrogator.rb'
require './lib/direction_giver.rb'

init = UserInterrogator.new
director = DirectionGiver.new
init.display_station_list!
start = init.get_starting_station!
final = init.get_final_station!

instructions = director.transit_instructions(start, final)
puts instructions


# if start.get_my_line == "L" && final.get_my_line == "L"
# 	direction = director.ride_on_l(start,final)
# 	num_of_stops = director.number_of_stops(start,final)
# 	director.give_directions(start, final, direction, num_of_stops)
# elsif start.get_my_line == "F" && final.get_my_line == "F"
# 	direction = director.ride_on_f(start,final)
# 	num_of_stops = director.number_of_stops(start,final)
# 	director.give_directions(start, final, direction, num_of_stops)
# else
# 	puts "You'll need to transfer and I haven't coded that yet."
# end
