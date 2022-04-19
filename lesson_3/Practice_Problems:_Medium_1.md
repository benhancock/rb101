# Question 1
My solution:
(0..10).each {|n| puts "#{" " * n}The Flintstones Rock!"}

Better LS solution:
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# Question 2
(40 + 2) results in an integer, which is not implicitly coerced by Ruby into a printable string. So, we can:

Convert the integer to a string using to_s:
puts "the value of 40 + 2 is " + (40 + 2).to_s

Or, interpolate the integer into the rest of the string:
puts "the value of 40 + 2 is #{40 + 2}"

# Question 3
def factors(number)
  divisor = number
  factors = []
  while factors > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  factors
end

Bonus 1:
number % divisor == 0 is used to determine if the divisor divides evenly (with no remainder) into the number

Bonus 2:
By putting 'factors' as the last line, the author is ensuring that the value of factors is what is returned by the method.

# Question 4
While << modifies the caller, + does not. This means that the buffer variable can be directly changed using <<, whereas with +, the buffer variable can only be reassigned within the method, and will not be changed.

# Question 5
Because the limit variable is defined outside of the fib method definition, it is not accessible to the method. Simply defining limit within the method definition would fix this issue. Alternatively, the limit variable could be defined as a CONSTANT, which would make it accessible to the method. Another option is to alter the method to accept three arguments, and pass limit into the method as an argument. All three of these solutions would make the limit variable accessible to the method. 

# Question 6
34

# Question 7
The hash#[] method mutates the caller, so the family's data did get ransacked.

# Question 8
paper

# Question 9
"no"
