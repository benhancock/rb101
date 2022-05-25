## Problem 1

arr.sort_by do |a, b|
  b.to_i <=> a.to_i
end

## Problem 2

books.sort_by do |book|
  book[:published].to_i
end

(integer conversion not necessary)

## Problem 3

arr1[2][1][3]

arr2[1][:third][0]

arr3[2][:third][0][0]

hsh1['b'][1]

hsh2[:third].keys[0]

## Problem 4

arr1[1][1] = 4

arr2[2] = 4

hsh1[:first][2][0] = 4

hsh2[['a']][:a][2] = 4

## Problem 5

my solution:
total_age = 0
munsters.each do |k, v|
  if v["gender"] == "male"
    total_age += v["age"]
  end
end

better ls solution:
total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

## Problem 6

munsters.each do |k, v|
  puts "#{k} is a #{v["age"]}-year-old #{v["gender]}.
end

## Problem 7

[4, [3, 8]]

## Problem 8

vowels = ['a', 'e', 'i', 'o', 'u']
hsh.each_value do |value|
  value.each do |string|
    string.each_char do |char|
      puts char if vowels.include?(char)
    end
  end
end

## Problem 9

arr.map do |subarr|
  subarr.sort_by do |a, b|
    b <=> a
  end
end

## Problem 10

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  new_hsh = {}
  hsh.each do |key, int|
    new_hsh[key] = int + 1
  end
  new_hsh
end

## Problem 11

arr.map do |subarr|
  subarr.select do |num|
    num % 3 == 0
  end
end

## Problem 12

arr.each_with_object({}) do |elem, hash|
  hash[elem[0]] = elem[1]
end

## Problem 13

arr.sort_by do |elem|
  elem.select {|num| num.odd?}
end

## Problem 14

hsh.map |_, v|
  if v[:type] == 'fruit
    v[:colors].map {|color| color.capitalize}
  else
    v[:size].upcase
  end
end

## Problem 15

arr.select do |hash|
  hash.values.flatten.all? {|num| num.even?}
end

## Problem 16

def uuid_generator
  characters = [('a'..'z').to_a, (0..9).to_a].flatten
  template = "12345678-1234-1234-1234-123456789abc".split("")

  uuid_unjoined = template.map do |char|
          if char == "-"
            "-"
          else
            characters.sample
          end
        end

  uuid_unjoined.join
end