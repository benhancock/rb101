## Question 1
The greeting variable should return nil, because even though the line greeting = "hello world" is not executed, the if statement 1. does not have its own scope and 2. initializes variables as nil even if code is not executed.

## Question 2
=> {:a=>"hi there"}

## Question 3
A)
one is: one
two is: two
three is: three

B)
one is: one
two is: two
three is: three

C)
one is: two
two is: three
three is: one

## Question 4
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.length != 4
    return false
  end
  dot_separated_words.each do |word|
    unless is_an_ip_number?(word)
      return false
    end
  end
  return true
end