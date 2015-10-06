
input = ''

def calculate 
	puts "How much is the bill?"
	@bill = get_input
	puts "What tip percent would you like to give?"
	puts "type 1 ->10% 2 -> 15% 3 -> 20%"
	@option = get_input.to_i
	until [1,2,3].include? @option
	puts "- Invaild - type 1 ->10% 2 -> 15% 3 -> 20%"
	@option = get_input.to_i
	end
	tip = multiply_tip
	total = @bill + tip
	puts 

	puts """
	|       Receipt       |
	|   400 NW 26th St    |
	|       MIAMI         |
	|  ORDER#17   Table 2 |
	| Server: Henry       |
 	TOTAL  $#{sprintf "%.2f",@bill}
 	TIP    $#{sprintf "%.2f",tip}
 	_____________________
 	GRAND TOTAL   $#{sprintf "%.2f", total}
	|                     |
	|                     |
	|                     |
	|                     |



	"""
end 

def multiply_tip
	case @option
	when 1 then @bill * 0.10
	when 2 then @bill * 0.15
	when 3 then @bill * 0.20
	end
end
def get_input
	input = gets.chomp.to_f
end

calculate

