-- functional.lua
-- Contains various algorithms and constructs used for functional programming.
-- 
-- Convention wise, all functions without any suffix work on a list/array
-- and do not mutate their arguments.  Those suffixed with a 't' work on
-- tables instead of lists (the lambda takes in a key and value pair).

require "table-helpers"

-- List Functions --

-- Applies lambda to all values in list.  The resulting values returned
-- from the lambda are then used to form a new list, which is returned.
-- Note that list and lambda are not modified.
--
-- Lambda should take in a value and return a value
function map(list, lambda)
	 local result = {}

	 for k, v in ipairs(list) do
			result[k] = lambda(v)
	 end

	 return result
end

-- Used to reduce items in a list based on a critiera.  This will create
-- a new list.  Each value in list is passed to lambda.  If lambda returns
-- true then it is added to the result list.
-- This does not mutate list or lambda.
--
-- Lambda should take a single value and return true or false
function filter(list, lambda)
	 local result = {}

	 for k, v in ipairs(list) do
			if lambda(v) then
				 table.insert(result, v)
			end
	 end

	 return result
end

-- Used to reduce a list.  This will return a list starting with the
-- left-most element.  This takes in a list, lambda, and a initial
-- value.  The initial value is passed as the current value to the first
-- lambda call.
--
-- The lambda passed in should take two values - (value, current) where
-- where value is the next list value and current is the current accumulated
-- value.
function foldl(list, lambda, initial_value)
	 local result = initial_value

	 for k, v in ipairs(list) do
			result = lambda(v, result)
	 end

	 return result
end

-- Same as foldl, except it reduces from the right side of the list instead
-- of the left side.
function foldr(list, lambda, initial_value)
	 local result = initial_value

	 for k, v in ripairs(list) do
			result = lambda(v, result)
	 end

	 return result
end

-- Applies lambda to each element.  This does not return a result - it
-- simply applies the given lambda to each value in the list.
function foreach(list, lambda)
	 for k, v in ipairs(list) do
			lambda(v)
	 end
end
