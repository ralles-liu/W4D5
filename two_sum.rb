def two_sum?(arr, target_sum)
    hash = Hash.new
    arr.each do |ele|
        dif = target - ele
        if hash.include?(dif)
            return true 
        end
        hash[ele] = "seen"
    end
    return false
end

