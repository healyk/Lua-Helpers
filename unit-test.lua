-- unit-test.lua
-- Helper functions for doing unit tests.

require "table"

unit_test = unit_test or {}

function unit_test.assert(expected, actual, failure_message)
	 local success = true

	 if type(actual) == "table" and not table.equal(expected, actual) then
			success = false
	 elseif type(actual) ~= "table" and expected ~= actual then
			success = false				 
	 end

	 if not success then
			print("== FAILURE! ==\n" .. failure_message)
			print("Expected: " .. expected)
			print("Actual: " .. actual)
			print("==============\n")
			return false
	 end

	 return true
end

function unit_test.run_test(test, name)
	 local result = test()

	 if result then
			print(name .. " [SUCCESS]")
	 else
			print(name .. " [FAIL   ]")
	 end
end
