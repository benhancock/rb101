## Problem 1

This method would return [1, 2, 3] because the block evaluates as true every time. This is because the last line of the block is the string 'hi', which is truthy.

## Problem 2

The block's return value determines whether 1 will be added to the method's count. If the block returns a truthy value, it adds 1 to the integer that will be returned by the method. We can find this out by consulting the ruby docs or by testing the method ourselves.

## Problem 3

This method would return [1, 2, 3] because the last line of the block, a puts statement, evaluates to nil. Reject returns a new array containing all of the elements for which a block evaluated to something other than true.

## Problem 4

This method would return { "a" => "ant", "b" => "bear", "c" => "cat" }, since #each_with_object creates a new object, in this case a hash, into which items from the original collection are added.

## Problem 5

By checking the Ruby docs, we can find that hash#shift removes the first element of a hash and returns a 2-element array containing the original element's key and value.

## Problem 6

This statement would return 11, because Array#pop removes and returns the last element of the array, which in this case is a string, and size then finds the number of characters in that string, which is 11.

## Problem 7

The block would return true, because the last line of the block is the method call odd?, which returns true if an integer is odd. any? would return true, since at least one of the elements in the collection on which it is called (the first element) result in a truthy return value when the block is executed. Because of ruby's short-circuiting, any? will stop executing after it has its first truthy value, so the only output will be 1.

## Problem 8

By checking the ruby docs, we can find that Array#take is not destructive, and it returns a new array containing the first n elements of the array it is called on. Since 2 is passed in to take, it will return [1, 2].

## Problem 9

map will return [nil, bear], since map returns a new array containing each return value for each execution of its block.

## Problem 10

map will return [1, nil, nil] because the if statement will return nil if the element is greater than 1, and will return the element otherwise.