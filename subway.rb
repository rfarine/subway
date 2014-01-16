require './lib/user_interrogator.rb'

init = UserInterrogator.new
init.display_station_list!
start = init.get_starting_station!
final = init.get_final_station!
if start.get_my_line == "L" && final.get_my_line == "L"
	init.direction_to_ride_on_l(start,final)
else
	puts "Hey you're not riding the L."
end
