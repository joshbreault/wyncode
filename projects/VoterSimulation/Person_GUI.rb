class Person
attr_accessor :name, :party
	def initialize(name,party,app)
		@name,@party,@app   = name, party, app
	end
end

class Politician < Person
	attr_accessor :name, :party, :votes
	@votes = 1
end

class Voter < Person
end