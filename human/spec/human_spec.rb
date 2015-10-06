require "./human.rb"
describe Human do
	context 'Before breakfast a person' do
		before(:each) do
			@human = Human.new
		end
		it 'should be hungry' do
			expect(@human.tummy).to eq("hungry")
		end
   		it 'should be sleepy' do
   			expect(@human.state).to eq("sleepy")
   		end
   	end
   	context 'After coffee' do
   		before(:all) do
   			@human = Human.new
   			@human.get_coffee
   		end
    	it 'should be awake after drinking coffee' do
    		expect(@human.state).to eq("awake")
    	end
    	it 'should not be hungry after drinking coffee' do
    		expect(@human.tummy).to_not eq("hungry")
    	end

	end
end