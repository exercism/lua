# Introduction

Object oriented programming in Lua uses the same concepts as OOP in other languages: classes, instances, methods, etc.
The implementation of a class is done with plain Lua tables and functions, and (perhaps a new concept for you) _metatables_.

A quick example: let's create a `Car` class that can create new cars for a specified manufacturer

```lua
Car = {}
Car.__index = Car

function Car.new(class, manufacturer)
  local new_car = {}
  new_car.manufacturer = manufacturer
  setmetatable(new_car, class)
  return new_car
end

my_car = Car.new(Car, "Volvo")
print(my_car.manufacturer)   -- Volvo
```

We can see the class is just a table with one member, a function named `new`.
The `new` function creates a table, adds a member to it, does some magic, and then returns the table.
We will see what `__index` and `setmetatable` do a little further down.
This "new" function is acting as the constructor for the class, creating a new instance.

~~~~exercism/note
Why did I have to pass `Car` as the first argument to `new`?
This is a convention to enable something called "colon notation".

## Colon notation

Lua has a bit of "syntactic sugar" that allows us to have a more OO-like syntax.
We can write

```lua
my_car = Car.new(Car, "Volvo")
```

or, with colon notation, we can write

```lua
my_car = Car:new("Volvo")
```

The colon notation can pass the left-hand side of the colon as the first argument.

The constructor itself can be written with colon notation.
In this case `self` is enforced to be the name of the class.

```lua
function Car:new(manufacturer)
  local new_car = {}
  new_car.manufacturer = manufacturer
  setmetatable(new_car, self)         -- <<< here
  return new_car
end
```

We will be defining methods using this colon notation.
~~~~

## Methods

We have a new car, but it can't do anything.
Let's add a method to the class.

```lua
function Car:honk()
  print("The " .. self.manufacturer .. " car goes: beep!")
end

my_car:honk()       -- The Volvo car goes: beep!
```

How does the car instance know where to find the `honk` method?
The Car "new" constructor did not add a honk function to the instance table.

### Method lookup

This is where **metatables** come in to the picture.

It goes like this.

1. Does `my_car` have a `honk` member? No.
1. Does `my_car` have a metatable? Yes, we set the metatable for `my_car` to be `Car`.
1. Does the metatable have an `__index` element? Yes, we wrote `Car.__index = Car`
1. Does `Car` (the "metavalue" for the `__index` "metamethod") have a `honk` member? Yes!

This is how `my_car:honk()` can be resolved to `Car.honk(my_car)`.

See [this guide][metatables] for more details about metatables.

## Inheritance

We can add a base class for `Car` by setting a metatable on the class, expanding the method lookup path.

```lua
Vehicle = {}
Vehicle.__index = Vehicle

setmetatable(Car, Vehicle)

function Vehicle:drive()
  print("The " .. self.manufacturer .. " vehicle advances.")
end

my_car:drive()         -- The Volvo vehicle advances.
```

## Alternate instance construction

Sometimes you might prefer to construct an instance without a specific `new` method.
You might prefer to write it this way.

```lua
my_other_car = Car("Porsche")
```

Lua "metamethods" can do this.
We need to tell Lua what to do when someone _calls_ the Car table.

We do this by adding a `__call` element to Car's _metatable_, and the value for `__call` will be a function

```lua
Vehicle.__call = function(class, ...) return class:new(...) end
```

Now:

```lua
my_other_car = Car("Porsche")
my_other_car:drive()        -- The Porsche vehicle advances.
```

~~~~exercism/note
A couple of footnotes here:

1. If our class does not already have a metatable, we can specify it like this.

   ```lua
   setmetatable(MyClass, {
     __call = function(class, ...) return class:new(...) end
   })
   ```

1. `...` is real Lua syntax: use it to capture "variadic arguments" into a list.
   This is [described in the manual](https://www.lua.org/manual/5.4/manual.html#3.4.11).

1. There are several other metamethods available that can control how your objects react to arithmetic operators, comparison operators, and other operations.
   As usual, details [are in the manual](https://www.lua.org/manual/5.4/manual.html#2.4),
~~~~

## Summary

To create a class, you can use this 6-step convention.

```lua
-- A Robot module

local Robot = {}        -- 1. name the class
Robot.__index = Robot   -- 2. set the index for the class

function Robot:new(attributes)
  local robot = {}    -- 3. name the new instance

  -- 4. set the metatable
  --    since `new` is called on the class, `self` is the class
  setmetatable(robot, self)

  -- 5. do stuff with the attributes
  robot.name = attributes.name or "Anonymous"

  -- `robot` is a "proper" instance now, so it's OK to call methods on it here.

  return robot        -- 6. return the new instance
end

local my_robot = Robot:new({ name = "Robbie" })

return Robot
```

Read more details in the (sadly archived) [LuaUsersWiki][wiki].


[metatables]: https://create.roblox.com/docs/luau/metatables
[wiki]: https://web.archive.org/web/20240104094707/http://lua-users.org/wiki/ObjectOrientationTutorial
