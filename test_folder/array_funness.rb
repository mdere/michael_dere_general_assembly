a = [1,2,3]

def double_the_array(x)
    # elements
    y = Array.new(x.size)
    # [nil , nil , nil]
    # [0 , 1 , 2]
    # y[0] => nil
    # x[0] => 1
    #
    i = 0
    x.each do |element| # element = x[i] whereas i is x amount of indexes 0 - n
         y[i]= element * 2
         i = i + 1
    end
    return y
end

puts a.inspect
puts double_the_array(a).inspect