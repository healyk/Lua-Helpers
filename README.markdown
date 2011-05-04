# Lua Helpers

This is a collection of various Lua code that I've found useful.  It is mainly
geared towards functional programming and data structures.

Here is a breakdown of what the various files contain:

## require "functional"

Contains the following functions:

  * map
  * filter
  * foldl and foldr
  * foreach

## require "unit-test"

Includes simple assertions for unit testing.

## require "table"

  * table.size - how many elements is the table?
  * table.equal - do two tables contain the same key, value pairs?
  * ripairs - reverse ipair iteration construct
  * table.clone - creates a copy of a given table
  * table.copy - copies a table's contents into another table
  * table.contains_value - does this table contain this value?
  * table.is_empty - does the table contain no values?

## License

Licensed under the [MIT license](http://www.opensource.org/licenses/mit-license.php)