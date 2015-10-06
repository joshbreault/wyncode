class Person
attr_accessor :name, :party
	def initialize(name,party)
		@name,@party  = name, party
	end
end

class Politician < Person
	attr_accessor :name, :party, :votes
	def initialize(name,party)
		@name, @party = name, party, votes
		@votes = 1
	end
end

class Voter < Person
end