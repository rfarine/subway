require './lib/user_interrogator.rb'

init = UserInterrogator.new
init.display_station_list!
start = init.get_starting_station!
final = init.get_final_station!
if start.get_my_line == "L" && final.get_my_line == "L"
	direction = init.direction_to_ride_on_l(start,final)
	init.give_directions(start, final, direction)
elsif start.get_my_line == "F" && final.get_my_line == "F"
	direction = init.direction_to_ride_on_f(start,final)
	init.give_directions(start, final, direction)
else
	puts "You'll need to transfer and I haven't coded that yet."
end
