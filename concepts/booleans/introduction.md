# Introduction

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

Both `and` and `or` uses *short-circuit evaluation*, which means they evaluate their second operand only when necessary. All operations are evaluated according to the [operator precedence](https://www.lua.org/manual/5.4/manual.html#3.4.8), where `not` is avaluated before `and` and `or`.
