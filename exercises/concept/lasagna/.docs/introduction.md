# Introduction

## Basics

[Lua](https://lua.org) is a simple yet powerful, efficient, lightweight, embeddable scripting language. It is designed, implemented, and maintained at [PUC-RIO](https://www.puc-rio.br/) in Brazil since 1993 by the team of Roberto Ierusalimschy, Waldemar Celes and Luiz Henrique de Figueiredo.

### Comments

Single line comments in Lua start with `--` and multiline comments start with `--[[` and end with `]]`.
```lua
-- This is a single line comment.

--[[This is
a multiline
comment
]]
```

### Variables

There are three types of variables in Lua: global variables, local variables and table fields. To keep things simple only local variables are explained here. By default all variables are global so we have to declare local variables as such with the keyword `local`.
```lua
local x
```

A value can be assigned to a variable by using the `=` operator.
```lua
local x = 1
```

The scope of a `local` variable is limited to the block where it is declared. A block can be the body of a control structure, the body of a function or a file or string where the variable is declared.
```lua
local x = 1

if x == 1 then
  local x = 2
  print(x) -- prints 2
end

print(x) -- prints 1
```

### Functions

A function is declared with the keyword `function` and, like variables, is global by default. A function definition has a name, a list of parameters and a body. The functions exits when the keyword `return` is reached and returns all values listed after it. Without a specified `return`, the function will return `nil`.

```lua
-- Defining a local function which returns "Hello " followed by 
-- the name which was given as parameter
local function say_hello(name)
  return 'Hello ' .. name
end
```

### Tables

Tables are the only data structuring mechanism in Lua and very powerful. They are used to represent arrays, sets, object, modules and many more. Essentially a table in Lua is an associative array.
```lua
-- create a table and assign its reference to tbl
local tbl = {}

-- new entry with key 'x' and value 1
tbl['x'] = 1

-- printing the value
print(tbl['x'])  --> 1

-- uninitialized table fields evaluate to nil
print(tbl['y'])  --> nil

-- there is also syntactic sugar - the following is the same as above
tbl.y = 1
print(tbl.y)    --> 1
```

This is just a tiny insight which is needed for the next section. We come back to this topic in detail later.

### Modules

A module is a collection of code which is stored in a `.lua` source file. Everything that the modules exports is stored in a table and this table is returned at the end of the file. So the table basically acts as a kind of namespace.
```lua
-- say-hello.lua

-- defining the table 'say' which is exported at the end
local say = {}

-- defining the function 'hello' as a table field
-- this is syntax sugar for: say.hello = function() print('Hello!') end
function say.hello()
  print('Hello!')
end

-- returning (exporting) the table 'say'
return say
```

That module can then be loaded into another file through the function `require`, that returns the table.
```lua
-- lets_say_hello.lua
local say = require('say-hello')
say.hello() -- prints "Hello!"
```

When we see `say.hello` we would think of "the function `hello` from the module `say`". But knowing our `say-hello.lua` returns a table and looking back at the table section, we notice in Lua the expression means "indexing the table `say` using the string `hello` as key".  

Although it is good practice for a module to return a table, it is just as possible to return any other type, such as a function.

```lua
--- say-bye.lua
local function bye()
  print('Bye!')
end

return bye
```
