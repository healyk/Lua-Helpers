-- unit-test.lua
-- Helper functions for doing unit tests.

require "table-helpers"

unit_test = unit_test or {}

function get_printable(val)
	 if val == nil then
			return "nil"
	 end

	 if type(val) == "boolean" then
			if val then 
				 return "true" 
			else 
				 return "false" 
			end
	 end
		
	 return val
end

function unit_test.assert(expected, actual, failure_message)
	 local success = true

	 if type(actual) == "table" and not table.equal(expected, actual) then
			success = false
	 elseif type(actual) ~= "table" and expected ~= actual then
			success = false				 
	 end

	 if not success then
			print("== FAILURE! ==\n" .. failure_message)
			print("Expected: " .. get_printable(expected))
			print("Actual: " .. get_printable(actual))
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
