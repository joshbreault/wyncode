class Human
	attr_accessor :state,:tummy
	def initialize
		@state = "sleepy"
		@tummy = "hungry"
	end
	def get_coffee
		@state = "awake"
		@tummy = "satisfied"
	end

end