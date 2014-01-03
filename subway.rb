require './user_interrogator'

init = UserInterrogator.new
init.display_station_list!
start = init.get_starting_station!
puts "Hi there I am in subwayrb and my start is #{start}"



#final = init.get_final_station!
#init.give_directions(start, final)