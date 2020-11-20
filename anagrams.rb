require "byebug"

# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true

def first_anagram?(string1, string2) #=> O(n!)
   permutation1 = string1.chars.permutation.to_a
   arr_str2 = string2.chars
   permutation1.include?(arr_str2)
end

# p first_anagram?("elvis", "lives")

#phase 2

def second_anagram?(str1, str2) #=> FINAL RUN TIME O(n * m)

    arr1 = str1.chars #> O(n)
    arr2 = str2.chars #> O(m)

    arr1.each do |char| #> O(n)
        # debugger
        index = arr2.find_index(char) #> O(m)
        #at this point its O(n * m)
        return false if index.nil? #> constant
        arr2.delete_at(index) #> O(m)
    end
    #at this point its O(n * 2m)
    
    # debugger
    arr2.empty? #> constant
end

# p second_anagram?("elvis", "lives")
# p second_anagram?("gizmo", "sally")


def third_anagram?(str1, str2) #> O(nlogn + mlogm)
    sorted1 = str1.chars.sort #> O(n) + O(nlogn) => O(nlogn)
    sorted2 = str2.chars.sort #> O(m) + O(mlogm) => O(mlogm)

    sorted1 == sorted2 #>O(n + m)

end

# p third_anagram?("elvis", "lives")
# p third_anagram?("gizmo", "sally")

def fourth_anagram?(str1, str2)
    count1 = Hash.new(0) #> constant
    count2 = Hash.new(0) #> constant

    str1.each_char { |char| count1[char] += 1 } #> O(n)
    str2.each_char { |char| count2[char] += 1 } #> O(m)

    count1 == count2 #> constant
end

p fourth_anagram?("elvis", "lives")
p fourth_anagram?("gizmo", "sally")

