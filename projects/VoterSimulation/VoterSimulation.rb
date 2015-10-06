require 'green_shoes'
require "./Person.rb"
class VoterSimulation
	def initialize(app)
		@app = app
	end
	@@list_of_politicians = []
	@@list_of_voters = []
	def  main_menu 
		puts "What would you like to do?"
		puts "(C)reate, (L)ist, (U)pdate, or (V)ote"

		get_input("C","L","U","V")
		options_select("create","list","update","vote")
	end
	def create
		puts "What wpuld you like to create?"
		puts "(P)oltican or (V)oter"
		get_input("P","V")
		options_select("create_politician","create_voter")
	end
	def create_politician
		puts "Enter name"
		@name = gets.chomp.capitalize
		puts "Enter political party"
		puts "(R)epublican or (D)emocrat"
		@party = political_party(get_input("R","D"))
		@@list_of_politicians << Politician.new(@name,@party)
		puts "You've created #{@name} the #{@party}"
		main_menu
	end
	def create_voter
		puts "Enter name"
		@name = gets.chomp.capitalize	
		puts "Enter political affiliation"
		puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
		@party = political_party(get_input("L","C","T","S","N"))
		@@list_of_voters << Voter.new(@name,@party)
		puts "You've created #{@name} the #{@party}"
		main_menu
	end
	def political_party(party_entered)
		case party_entered
		when "R"
			"Republican"
		when "D"
			"Democrat"
		when "L"
			"Liberal"
		when "C"
			"Conservative"
		when "T"
			"Tea Party"
		when "S"
			"Socialist"
		when "N"
			"Neutral"
		end
	end
	def return_5
		5
	end
	def list
		puts "----Voters---"
		@@list_of_voters.each do |i|
			puts "#{i.name}, #{i.party}"
		end
		puts ''
		puts "--Politicians--"
		@@list_of_politicians.each do |i|
			puts "#{i.name}, #{i.party}"
		end
		sleep(1)
		main_menu
	end
	def update
		puts "who would you like to update?"
		@name = gets.chomp
		@@list_of_politicians.each do |i|
			if @name = i.name
				puts "New name?"
				i.name = gets.chomp
				puts "New Party?"
				puts "(R)epublican or (D)emocrat"
				get_input("R","D")
				i.party = political_party(@input)
				main_menu
			end
		end
		@@list_of_voters.each do |i|
			if @name = i.name
				puts "New name?"
				i.name = gets.chomp
				puts "New Party?"
				puts "(C)reate, (L)ist, (U)pdate, or (V)ote"
				get_input("C","L","U","V")
				i.party = political_party(@input)
				main_menu
			end
		end
		puts "No one by that name found!"
		main_menu
	end
	def vote 
		@@democrats =[]
		@@republicans =[]
		@@list_of_politicians.each do |i|
			if i.party == "Democrat"
				@@democrats << i
			else 
				@@republicans << i
			end
		end
		@@list_of_voters.each do |i|
			vote_odds(i.party)
		end
		vote_results
	end
	def vote_odds(partys)
		case partys
		when "Socialist"
			if (Random.rand(100)+1) > 90
				vote_random_republican
			else
				vote_random_democrat
			end
		when "Liberal"
			if (Random.rand(100)+1) > 75
				vote_random_republican
			else
				vote_random_democrat
			end
		when "Conservative"
			if (Random.rand(100)+1) > 75
				vote_random_democrat
			else
				vote_random_republican
			end
		when "Tea Party"
			if (Random.rand(100)+1) > 90
				vote_random_democrat
			else
				vote_random_republican
			end
		when "Neutral"
			if (Random.rand(100)+1) > 50
				vote_random_democrat
			else
				vote_random_republican
			end
		end
	end
end
def vote_random_republican
	@@republicans[Random.rand(@@republicans.length)].votes += 1
end
def vote_random_democrat
	@@democrats[Random.rand(@@democrats.length)].votes += 1
end
def vote_results
	puts "--Politicians--"
	@@list_of_politicians.each do |i|
		puts "#{i.name}, #{i.party} #{i.votes}"
	end
end
def options_select(*possible_options)
	answer_index = @answers.index(@input)
	eval(possible_options[answer_index])
end
def get_input(*possible_answers)
	@answers = possible_answers
	@input = gets.chomp.capitalize
	accepted_response = false
	@answers.each do |i|
		if @input == i 
			accepted_response = true
		end
	end
	if accepted_response == true
		@input
	else
		puts "Invalid Answer!"
		main_menu
	end
end
vote = VoterSimulation.new
vote.main_menu