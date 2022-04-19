# Question 1
1
2
2
3

# Question 2
! has two main uses: as a "not" operator, and as an indicator that a method mutates the caller. ? has two main uses: as part of the syntax of the ternary operator, and as an indicator that a method is testing a value in some way.

1. != is the "not equal" comparison operator, and is used to test whether two values are not equal to eachother.
2. When '!' is put before a value, it returns the opposite of that value's truthiness. If the value is truthy, putting ! in front of it would return false, and if the value is falsy putting ! in front of it would return true.
3. When '!' appears at the end of a method name, that is an indicator that the method mutates the caller. For example, words.uniq! would mutate the words object.
4. If '?' appears before something, that is usually because that thing is a part of a ternary operator.
5. If '?' appears at the end of a method name, that is an indicator that the method is testing the values passed into it in some way, and returning a boolean value. For example, the Ruby method "odd?" returns true if the integer it is called on is odd.
6. '!!' returns the truthiness or falsiness of the value it is called on. So while putting ! in front of a truthy value will return false, putting !! in front of a truthy value will return true, and vice versa.


# Question 3
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')

# Question 4
delete_at(1) would delete the value at index 1, which is 2.
numbers = [1, 3, 4, 5]

delete(1) would delete all instances of the integer 1.
numbers = [2, 3, 4, 5]

# Question 5
my solution:
if 42 in range(10..100)
  true
else
  false

improved ls solution:
(10..100).cover?(42)

# Question 6
"Four score and " + famous_words
"Four score and " << famous_words

# Question 7
flintstones.flatten!

# Question 8
my solution:
flintstones = ["Barney", flintstones["Barney"]]

improved ls solution:
flintstones.assoc("Barney")