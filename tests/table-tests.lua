require "table-helpers"
require "unit-test"

function size_test()
	 if unit_test.assert(5, table.size({1,2,3,4,5}), "Size failure") then
			if unit_test.assert(0, table.size({}), "Zero element failure") then
				 return true
			end
	 end
	 
	 return false
end

function contains_value_test()
	 if unit_test.assert(true, table.contains_value({1,2,3}, 2), 
											 "Contains value!") and
  	 unit_test.assert(false, table.contains_value({1,2,3}, 5),
											"Doesn't contain value!") and
	   unit_test.assert(false, table.contains_value({}, 3),
											"Empty test problem...") 
	then
		 return true
	end
	
	return false
end

print("Beginning table test")
unit_test.run_test(size_test, "size_test")
unit_test.run_test(contains_value_test, "contains_value_test")
print("End test")