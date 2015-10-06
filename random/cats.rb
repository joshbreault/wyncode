cats = Array.new(100, 1)
i= 0
cats.map! do |x| x +=i
    i +=1
end

j = 1
while j <= cats.length
    i = j-1
    while i < cats.length
        cats[i] *= -1
        i+=j
    end
        
        j+=1
    end

No_Hats = cats.reject! {|x| x >= 0 }
Cats_No_Hats = No_Hats.map { |i| i * -1 }
puts Cats_No_Hats