puts "Hello and welcome to \"Guess That Word!\""
puts "Become a millionaire in seconds!"
puts "Type: \"Rules\" - For a complete set of instructions"
puts "Type: \"Start\" - To begin your voyage of fortunes!"
puts "Type:  \"End\"  - To quit at any moment"
input = gets.chomp!.downcase

if input == "rules"
	puts <<-RULES
	You will be shown blank spaces that represent letters to a word. 
	You will start with 1000 dollars, every time you 
	guess a letter you will be charged 100 dollars. 
	If the letter is correct, you will be given back a cash amount d
	etermined by how rare the letter is. You also have the option of 
	guessing the word. That will cost you 500 dollars but if correct 
	will return the total of all the missing letters in the word.

	Controls: Just enter the letter you want to guess
	Controls: Type the word \"Word\" to guess the word
	Controls: Type the word \"Hint\" to get a hint at a $300

	Note: all words and letters are case insensative

	Type - anything to begin or nothing to quit

	RULES

	input = gets.chomp!.downcase
	if input == "end"
	elsif input != nil || input == " "
		input = "start"
	end
end

@money = 1000
@words = [

	"cat".chars,
	"boy".chars,
	"watch".chars,
	"dance".chars,
	"tower".chars,
	"videogamer".chars,
	"robbery".chars
]

@emoticons = [

	"\xF0\x9F\x90\x88", #emoji of a cat
	"\xF0\x9F\x91\xA6", # emoji of a boy
	"\xE2\x8C\x9A", #emoji of a watch
	"\xF0\x9F\x92\x83", #emoji of a dancer
	"\xF0\x9F\x8F\xB0",  #emoji for towers
	"\xF0\x9F\x93\xBA \xF0\x9F\x8E\xAE \xF0\x9F\x91\xA6", #emoji for a tv + controller + person
	"\xF0\x9F\x94\xAB \xF0\x9F\x92\xB0 \xF0\x9F\x9A\x99 \xF0\x9F\x9A\x93" # gun + moneybag + car + police car
]
@letter_values = {

	'a' => 150,
	'b' => 150,
	'c' => 200,
	'd' => 200,
	'e' => 150,
	'f' => 200,
	'g' => 200,
	'h' => 200,
	'i' => 150,
	'j' => 250,
	'k' => 200,
	'l' => 200,
	'm' => 250,
	'n' => 200,
	'o' => 150,
	'p' => 200,
	'q' => 350,
	'r' => 200,
	's' => 200,
	't' => 200,
	'u' => 200,
	'v' => 300,
	'w' => 250,
	'x' => 350,
	'y' => 200,
	'z' => 350

}

def start_game
	gameover = false
	while true
		word_number = Random.rand(@words.length)
		arr = Array.new(@words[word_number].length, "_")
		wrong_letter = false
		print_arr = lambda do
			arr.each do |x|
			print "#{x} "
			end
			puts "\n"
		end
		if gameover == true
			break
		end
		while true
			puts "Guess This Word! - $#{@money}"
			print_arr.call
			input = gets.chomp!.downcase

			if input == "word"
				@money -=500
				input = gets.chomp!.downcase
				if input == @words[word_number].join
					@money += 500
					puts "Correct!"
					arr.each_with_index do |e, i|
						if e == "_"
							@words[word_number].each_with_index do |el,ind|
								if ind == i
									@money += @letter_values[el]
								end
							end
						end
					end
					arr = @words[word_number]
					print_arr.call
					break
				end
			elsif input == "hint"
				@money -= 300
				puts @emoticons[word_number]
			elsif input == "end"
				gameover = true
			elsif input.length > 1 || input.length < 1
				puts "Invaid word"
			else
				@money -= 100
				@words[word_number].each_with_index do |e, i|
					if input == e
						@money += @letter_values[e] + 100
						arr[i] = e
					end
				end
			end
			if @money <= 0
				gameover = true
				puts "GAME OVER!"
				break
			elsif gameover == true
				puts "GAME OVER!"
					break
			elsif arr == @words[word_number]
				arr.each do |x|
				print "#{x} "
				end
				puts "\n"
				puts "You got it!"
				break
			end
		end
	end
end

if input == "start"
	start_game
end
