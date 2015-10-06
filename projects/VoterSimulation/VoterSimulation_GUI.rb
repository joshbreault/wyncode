require "./Person_GUI.rb"
Shoes.app(:width => 600, :height => 500,:title => "Voter Simulator") do
	@@arr_voters = []
	@@arr_politicians = []
	def main_menu
		@start = stack(:margin_left => 225,:margin_top => 200) do
			para "Would you like to do?"
			flow do
				@create = button "create"
				@list = button "list"
				@update = button "Update"
				@list.click do

					@start.remove
					list
				end
				@create.click do
					@start.remove
					create
				end
			end
		end
	end
	def list
		@list = stack do
			flow do
				@home_button = button "Home"
				flow do
					stack(margin_left: 250) do
						@polic_list = stack() do
							para strong("---Politicians---")
							@@arr_politicians.each { |number| para "#{number.name}, #{number.party}"}
						end
						@voter_list = stack() do
							para strong("-----Voters-----")
							@@arr_voters.each { |number| para "#{number.name}, #{number.party}"}
						end
					end
				end
			end
			@home_button.click do
				@list.remove
				@polic_list.remove
				@voter_list.remove
				main_menu
			end
		end
	end
	def create 
		@homestack = stack do
			@home_button= button "Home"
		end
		@create = stack(:margin_left => 200,:margin_top => 170) do
			para "what would you like to create?"
			flow(:margin_left => 15) do
				@politician_button = button "Politician"
				@voter_button = button "Voter"
				@voter_button.click do
					@create.remove
					@homestick.remove
					create_voter
				end
					@politician_button.click do
					@create.remove
					@homestick.remove
					create_politician
				end
			end
			@home_button.click do
				@homestack.remove
				@create.remove
				main_menu
			end
		end
	end
	def create_politician
		@create_politician = stack(:margin_top => 200) do
			flow(:margin_left => 145)do
				para "Please enter a name and select a political party"
			end
			flow(:margin_left => 205) do
				@name_entered = edit_line
			end 
			flow(:margin_left => 50) do 
				@democrat_button = button "Democrat"
				@republican_button = button "Republican"
			end
			@democrat_button.click do
				@party_entered = "Democrat"
				@@arr_politicians << Politician.new(@name_entered.text,@party_entered,self)
				@create_politician.remove
				main_menu
			end
			@republican_button.click do
				@party_entered = "Republican"
				@@arr_politicians << Politician.new(@name_entered.text,@party_entered,self)
				@create_politician.remove
				main_menu
			end
		end
	end
	def create_voter
		@create_voter = stack(:margin_top => 200) do
			flow(:margin_left => 145)do
				para "Please enter a name and select a political party"
			end
			flow(:margin_left => 205) do
				@name_entered = edit_line
			end 
			flow(:margin_left => 50) do 
				@socialist_button = button "Socialist"
				@liberal_button = button "Liberal"
				@conservative_button = button "Conservative"
				@tea_party_button = button "Tea Party"
				@neutral_button = button "Neutral"
			end
			@socialist_button.click do
				@party_entered = "Socialist"
				@@arr_voters << Voter.new(@name_entered.text,@party_entered,self)
				@create_voter.remove
				main_menu
			end
			@liberal_button.click do
				@party_entered = "Liberal"
				@@arr_voters << Voter.new(@name_entered.text,@party_entered,self)
				@create_voter.remove
				main_menu
			end
			@conservative_button.click do
				@party_entered = "Conservative"
				@@arr_voters << Voter.new(@name_entered.text,@party_entered,self)
				@create_voter.remove
				main_menu
			end
			@tea_party_button.click do
				@party_entered = "Tea Party"
				@@arr_voters << Voter.new(@name_entered.text,@party_entered,self)
				@create_voter.remove
				main_menu
			end
			@neutral_button.click do
				@party_entered = "Neutral"
				@@arr_voters << Voter.new(@name_entered.text,@party_entered,self)
				@create_voter.remove
				main_menu
			end
		end
	end
	stack do
		main_menu
	end
end