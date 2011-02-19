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

print("Beginning tests....")
unit_test.run_test(map_test, "map_test")
unit_test.run_test(filter_test, "filter_test")
print("End tests")