# About

The boolean type in Lua has the two traditional boolean values: `true` and `false`. These values can be assigned to a variable, combined with logical operators (`and`, `or`, `not`) and used in conditional tests (e.g. in control structures).

```lua
local is_true = true
local is_false = false

true and true  --> true
true and false --> false
false or true  --> true
false or false --> false
not false      --> true
not true       --> false

-- prints 0
if is_true == true then
  print(0)
else
  print(1)
end
```

Conditional tests and the logical operators consider both the boolean `false` and `nil` as false and anything else as true.
```lua
1 and 2          --> 2
nil and 2        --> nil
false and 2      --> false
1 or 2           --> 1
false or 'hello' --> "hello"
nil or false     --> false
```

Both `and` and `or` uses *short-circuit evaluation*, which means they evaluate their second operand only when necessary. All operations are evaluated according to the [operator precedence](https://www.lua.org/manual/5.4/manual.html#3.4.8), where `not` is evaluated before `and` and `or`.

Given that only `false` and `nil` are considered false and everything else is true a common idiom in Lua is:
```lua
x = x or y
```

This is equivalent to:
```lua
if not x then
  x = y
end
```

It is pretty common to use this in functions, to assign a default value if a parameter has no value (is `nil`):
```lua
local function hello(name)
  name = name or "World"
  print("Hello " .. name)
end

hello()       --> "Hello World"
hello('Mars') --> "Hello Mars"
```
