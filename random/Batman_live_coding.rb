puts "After all of your hard work you've become batman!"

puts "Who will be your sidekick?"

puts "Options: Batgirl or Robin"

sidekick = gets.chomp!.downcase

if sidekick == "robin"
	puts "Robin: Holy rusted metal batman"
elsif sidekick == "batgirl"
	puts "Batgirl: Suit me up, Uncle Alfred"
else
	puts "Fine I'll choose one"
	sidekick = "robin"
end

sidekick.capitalize!

puts "Awesome choice! Lets give your sidekick a weapon. "
puts "Options: batarang, fists, flashlight"

weapon = gets.chomp!.downcase

case weapon
when "batarang"
	puts "#{sidekick}: Awesome! A batarang! Thanks Batman!"
when "fists"
	puts "#{sidekick}: I dont need a weapon, I'll just use my fists like you Batman"
when "flashlight"
	puts "#{sidekick}: uh... Thanks? I'll make sure to keep the light on you"
else
	puts "Dont be selfish share your toys with your sidekick!"
	weapon = "batarang"
end