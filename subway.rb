require './lib/user_interrogator.rb'
require './lib/direction_giver.rb'

init = UserInterrogator.new
director = DirectionGiver.new
init.display_station_list!
start = init.get_starting_station!
final = init.get_final_station!
puts director.transit_instructions(start, final)

