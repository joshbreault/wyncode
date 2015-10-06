puts "Enter bill total:"

bill = gets.chomp.to_f

puts "Enter tip amount:"

tip = gets.chomp.to_f / 100

tip_amount = bill * tip

puts "How many people are you spliting the meal with?"

people = gets.chomp.to_f

total_bill = bill + tip_amount

share = total_bill / people

puts "Bill: $#{bill}"
puts "Tip: $#{tip_amount}"
puts "Total: $#{total_bill}"
puts "Your share: $#{share}"