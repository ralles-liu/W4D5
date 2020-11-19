require "byebug"

def my_min_slow(arr) #O(n^2)
    
    (0...arr.length).each do |i|
        min_len = true
        # found_smaller = False
        (i...arr.length).each do |j|
            if arr[j] < arr[i]
                min_len = false
            end
        end   
        return arr[i] if min_len  
    end

end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# p my_min_slow(list)


def my_min_fast(arr)
    smallest = arr[0]
    arr.each do |ele|
        if ele < smallest
            smallest = ele
        end
    end
    return smallest
end


# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# p my_min_fast(list)



def largest_cont_subsum_slow(list) # n = list.length
    subarrs = find_subarrays(list) # n^2 runtime
    largest = subarrs[0].sum
    
    subarrs.each do |subarr|    # n^2 length subarrs
        largest = [largest, subarr.sum].max # constant
    end

    return largest
    # n^2 overall
end



def find_subarrays(list) # n = list.length
    subarr = []
    (0...list.length).each do |i| # n times
        (i...list.length).each do |j| # n times
            # we reach this part of our code n^2 times
            subarr << list[i..j] # constant? if this was n, then its n^3
        end
    end

    return subarr
end

# list = [everything before this added to a negative, 4, -5, -6, -1, 100]
# p largest_cont_subsum_slow(list)

def largest_cont_subsum_fast(list)
    # for constant size to be true, you cant create any variables
    # whose memory size depends on the size of the input
    curr_sum = list[0]
    largest_sum = list[0]

    # we know there are n^2 potential, so if we ever check all of them
    # it must be n^2

    # there must be a way to find the max without checking every subarray
    list[1..-1].each do |ele|
        # debugger
            if curr_sum > largest_sum
                largest_sum = curr_sum
            end

            if curr_sum < 0
                curr_sum = 0
            end

        curr_sum += ele

    end

    # debugger
    return [largest_sum, curr_sum].max

end

list = [2, 3, -6, 7, -6, 7]
p largest_cont_subsum_fast(list)


list2 = [-2, -3, -6, -7, -6, -7]
p largest_cont_subsum_fast(list2)