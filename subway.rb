require './lib/user_interrogator.rb'
require './lib/direction_giver.rb'

init = UserInterrogator.new
director = DirectionGiver.new
init.display_station_list!
start = init.get_starting_station!
final = init.get_final_station!

if start.get_my_line == final.get_my_line
	instructions = director.transit_instructions(start, final)
elsif start.get_my_line != final.get_my_line
	instructions = director.transfer_instructions(start,final)
else
	instructions = "No instructions to give."
end

puts instructions
