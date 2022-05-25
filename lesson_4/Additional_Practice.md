## Problem 1

new_arr = {}
flintstones.each_with_index do |name, idx|
  new_arr[name] = idx
end

## Problem 2

total = 0
ages.each_value {|value| total += value }

## Problem 3

ages.delete_if {|_, v| v >= 100}

## Problem 4

my (worse) solution:
  min_age = 9999
  ages.each do |_, age|
    if age < min_age
      min_age = age
    end
  end

ls solution:
  ages.values.min


## Problem 5

my (worse) solution:
  starts_with_Be = nil
  flintstones.each_with_index do |name, index|
    if name[0..1] == 'Be'
      starts_with_Be = index
    end
  end

ls solution:
  flintstones.index { |name| name[0, 2] == "Be" }

## Problem 6

My (worse) solutions:
    This version takes advantage of #each_with_index's lack of a need for a counter, but breaks the general rule to not mutate a collection while iterating through it:

      flintstones.each_with_index do |name, index|
        flintstones[index] = name[0, 4]
      end

    This version uses a counter and a while loop, and so uses more lines of code, but does not violate the above rule:

      counter = 0
      while counter < flintstones.size
        flintstones[counter] = name[0, 4]
        counter +=1
      end

ls solution:
flintstones.map! { |name| name[0,3] }

## Problem 7

my solution:
  letters = {}
  statement.chars.each do |ltr|
    if letters.keys.include? ltr
      letters[ltr] = letters[ltr] + 1
    else
      letters[ltr] = 1
    end
  end

ls solution:
  result = {}
  letters = ('A'..'Z').to_a + ('a'..'z').to_a

  letters.each do |letter|
    letter_frequency = statement.count(letter)
    result[letter] = letter_frequency if letter_frequency > 0
  end



## Problem 8

The first code excerpt would print
1
3
and the second would print
1
2


## Problem 9

my (worse) solution:
  words_array = words.split
  words_array.map do |word|
    word.capitalize
  end
  words_array.join(' ')

ls solution:
  words.split.map { |word| word.capitalize }.join(' ')

## Problem 10

munsters.each do |k, v|
  case v[age]
    when 0..17
      v[age_group] = "kid"
    when 18..64
      v[age_group] = "adult"
    else
      v[age_group] = "senior"
  end
end