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
