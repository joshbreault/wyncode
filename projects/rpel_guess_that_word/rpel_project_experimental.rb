puts "Hello and welcome to \"Guess That Word!\""
puts "Become a millionaire in seconds!"

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

def initialize_game
	puts "Type: \"Rules\" - For a complete set of instructions"
	puts "Type: \"Start\" - To begin your voyage of fortunes!"
	puts "Type:  \"End\"  - To quit at any moment"
	@input = gets.chomp!.downcase

	if @input == "rules"
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

		Type - anything to begin or \"End\" to quit

		RULES

		@input = gets.chomp!.downcase
		if @input == "end"
		elsif @input != nil || @input == " "
		@input = "start"
		end
	end
end

@money = 1000
def create_words_list
	@words = File.readlines("words.txt","r+")
	@words = @words[0].split("\n")
	@words.map! do |x|
		x.chars
	end
end

def create_hints_list
	@emoticons = File.readlines("emoticons.txt","r+")
	@emoticons = @emoticons[0].split("\n")
end

def start_game
	create_hints_list
	create_words_list
	@gameover = false
	while true
		@word_number = Random.rand(@words.length)
		@arr = Array.new(@words[@word_number].length, "_")
		@breakLine = false
		@print_arr = lambda do
			@arr.each do |x|
			print "#{x} "
			end
			puts "\n"
		end
		if @gameover == true
			break
		end
		while true
			puts "Guess This Word! - $#{@money}"
			@print_arr.call
			@input = gets.chomp!.downcase

			case @input
			when "word"
				guess_word
			when "hint"
				hint
			when "end"
				@gameover = true
			when "add"
				add_words
			when @input.length > 1 || @input.length < 1
				invalid
			else
				guess_letter
			end
			if @money <= 0
				@gameover = true
				puts "GAME OVER!"
				break
			elsif @gameover == true
				puts "GAME OVER!"
					break
			elsif @breakline == true
				break
			elsif @arr == @words[@word_number]
				@arr.each do |x|
				print "#{x} "
				end
				puts "\n"
				puts "You got it!"
				break
			end
		end
	end
end

def guess_word 
	@money -=500
	@input = gets.chomp!.downcase
	if @input == @words[@word_number].join
		@money += 500
		puts "Correct!"
		@arr.each_with_index do |e, i|
			if e == "_"
				@words[@word_number].each_with_index do |el,ind|
					if ind == i
						@money += @letter_values[el]
					end
				end
			end
		end
		@arr = @words[@word_number]
		@breakLine = true
	end
end

def hint
	@money -= 300
	puts @emoticons[@word_number]
end

def guess_letter
	@money -= 100
	@words[@word_number].each_with_index do |e, i|
		if @input == e
			@money += @letter_values[e] + 100
			@arr[i] = e
		end
	end
end

def invalid
	puts "Invalid response"
end

def add_words
	create_hints_list
	create_words_list
	puts "Enter a new word:"
	valid_word = true
	@input = gets.chomp!.downcase
	@words.each do |x|
		if @input.chars == x
			puts "This word is already added"
			valid_word = false
			add_words
		end
	end
	if valid_word == true
		File.open("words.txt","a") do |l|
			l.puts(@input)
		puts "Word added."
		add_hint
		end
	end
end

def add_hint
	puts "Add it's hint - Just copy and past emoticons onto here:"
	puts "Or just leave it blank for no hint"
	is_not_emoticon = false
	@input = gets.chomp
	@input.chars.each do |i|
		if i < "☁" && i != " "
			is_not_emoticon = true
		end
	end
	if is_not_emoticon == false
		File.open("emoticons.txt","a") do |l|
			l.puts(@input)
		end
		puts "#{@input}  added"
		initialize_game
	elsif is_not_emoticon == true
		puts "not a valid hint"
		add_hint
	else 
		@input = "No hint"
		File.open("emoticons.txt","a") do |l|
			l.puts(@input)
		end
		initialize_game
	end
end
initialize_game
while true
	case @input 
	when "start"
		start_game
		break
	when "end"
		break
	when "add"
		add_words
	else
		invalid
		@input = gets.chomp!.downcase
	end
end