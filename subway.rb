require './lib/user_interrogator.rb'

init = UserInterrogator.new
init.display_station_list!
start = init.get_starting_station!
final = init.get_final_station!
init.give_directions(start, final)