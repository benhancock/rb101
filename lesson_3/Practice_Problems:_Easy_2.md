# Question 1
ages.include?("Spot")
bonus:
ages.key?("Spot")
ages.member?("Spot")

# Question 2
munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!

# Question 3
ages.merge!(additional_ages)

# Question 4
my solution:
advice.include?("Dino")

ls solution:
advice.match?("Dino")

# Question 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 6
flintstones << "Dino"

# Question 7
flintstones.concat(%w(Dino Hoppy)) 

# Question 8
advice.slice!(0, advice.index('house'))
If string#slice were used, the string from 0 to advice.index('house') would be returned, but the advice string would remain the same.

# Question 9
statement.count "t"

# Question 10
title.center(40)

