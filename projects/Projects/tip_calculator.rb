class Calculator
  attr_accessor :share, :bill, :tip, :party, :total

  def initialize(bill, tip, party)
    @bill = bill
    @tip = tip
    @party = party
  end

  def tip_percent
    @tip = @bill * @tip
  end

  def total_bill
    @total = @bill + @tip
  end

  def bill_divider
    @share = (total_bill/party)
    puts "Your Share of the bill is: #{sprintf('%.2f',share)}"
  end

end

def prompt
  puts "How much is the bill?"
  bill = gets.chomp.to_f

  puts "How much would you like to tip?"
  tip = gets.chomp.to_f

  puts "How many people are in your party?"
  party = gets.chomp.to_i
end

p bill = prompt.gets.chomp

#myBill = Calculator.new(bill, tip, party)
# myBill.tip_percent
# myBill.total_bill

# puts "*" * 40
# myBill.bill_divider
# puts "*" * 40



