-- table.lua
-- Extended set of table utils to make life easier.
-- Author: Kris Healy

table = table or {}

-- Returns the number of elements in tbl
table.size = function (tbl)
	 local counter = 0

	 for k, v in pairs(tbl) do
			counter = counter + 1
	 end

	 return counter
end

-- If t1 and t2 contain the same k, v pairs then they will be considered
-- equal.  Note that this doesn't do a deep equals (key/value elements
-- that are tables themselves are not compared with this method)
table.equal = function (t1, t2)
	 if table.size(t1) == table.size(t2) then
			for k, v in pairs(t1) do
				 if v ~= t2[k] then
						return false
				 end
			end

			return true
	 else
			return false
	 end
end
