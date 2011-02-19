require "functional"
require "table-helpers"

function print_result(test, result)
	 if result then
			print(test .. " SUCCESS")
	 else
			print(test .. " FAILED")
	 end
end

function map_test()
	 local nums = { 1, 3, 5, 10 }
	 local expected = { 1, 9, 25, 100 }
	 local result = map(nums, function (v) return v * v end)

	 print_result("map_test", table.equal(result, expected))
end

function filter_test()
	 local nums = { 1, 2, 3, 4, 5 }
	 local result = filter(nums, function (v) return v % 2 == 0 end)
	 local expected = { 2, 4 }

	 print_result("filter_test", table.equal(result, expected))
end

print("Beginning tests....")
map_test()
filter_test()
print("End tests")