-- unit-test.lua
-- Helper functions for doing unit tests.

require "table"

unit_test = unit_test or {}

function unit_test.assert(expected, result, failure_message)
	 local success = true

	 if type(result) == "table" and not table.equal(expected, result) then
			success = false
	 elseif type(result) ~= "table" and expected ~= result then
			success = false				 
	 end

	 if not success then
			print("== FAILURE! ==\n" .. failure_message .. "\n=============")
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
