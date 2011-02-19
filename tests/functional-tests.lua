require "functional"
require "table-helpers"
require "unit-test"

function map_test()
	 local nums = { 1, 3, 5, 10 }
	 local expected = { 1, 9, 25, 100 }
	 local result = map(nums, function (v) return v * v end)

	 return unit_test.assert(expected, result, "map failed!")
end

function filter_test()
	 local nums = { 1, 2, 3, 4, 5 }
	 local result = filter(nums, function (v) return v % 2 == 0 end)
	 local expected = { 2, 4 }

	 return unit_test.assert(expected, result, "filter failed!")
end

function foldl_test()
	 local nums = { 'a', 'b', 'c' }
	 local result = foldl(nums, function (v, i) return i .. v end, "")
	 local expected = "abc"

	 return unit_test.assert(expected, result, "foldl failed!")
end

function foldr_test()
	 local nums = { 'a', 'b', 'c' }
	 local result = foldr(nums, function (v, i) return i .. v end, "")
	 local expected = "cba"

	 return unit_test.assert(expected, result, "foldr failed!")
end

function foreach_test()
	 local nums = { 1, 2, 3, 4, 5 }
	 local expected = { 1, 2, 3, 4, 5 }
	 local result = {}
	 local func = function (v) table.insert(result, v) end

	 foreach(nums, func)

	 return unit_test.assert(expected, result, "foreach failed!")
end

print("Beginning tests....")
unit_test.run_test(map_test, "map_test")
unit_test.run_test(filter_test, "filter_test")
unit_test.run_test(foldl_test, "foldl_test")
unit_test.run_test(foldr_test, "foldr_test")
unit_test.run_test(foreach_test, "foreach_test")
print("End tests")