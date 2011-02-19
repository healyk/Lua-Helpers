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

function reverse_iter(a, i)
	 i = i - 1

	 local v = a[i]
	 if v then
			return i, v
	 end
end

-- Reverse iterator over tables.  Used just like ipairs is used, but
-- will return elements in reverse order.
function ripairs(a)
	 return reverse_iter, a, table.size(a) + 1
end

-- Creates a new table and copies the contents of table into the
-- new table.
function table.copy(tbl)
   local result = {}

   util.table.copy(tbl, result)
   return result
end

-- Copies everything from src into dest.  Note that this is a shallow
-- copy.
function table.copy(src, dest)
   for k, v in pairs(src) do
      dest[k] = v
   end
end

-- Returns true if the list contains value
function table.contains_value(list, value)
   for k, v in pairs(list) do
      if value == v then
        return true
      end
	 end

	 return false
end

-- Returns true if a table is empty
function table.is_empty(tbl)
	 return table.size(tbl) == 0
end