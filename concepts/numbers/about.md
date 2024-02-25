# About

Lua uses two representations for numbers: 64-bit integer numbers and double-precision floating-point numbers.

~~~exercism/note
Before version 5.3, Lua represented all numbers using double-precision floating-point format.
~~~

Numbers can be written with an optional decimal part, plus an optional decimal exponent.
```lua
1               --> 1
0.2             --> 0.2
0.3e4           --> 2000.0
4.0e-3          --> 0.004
5.0e+20         --> 5e+20
```

A number with a decimal point or an exponent is considered a float and without is treated as an interger, but both have the type 'number'.
```lua
type(1)         --> number
type(2.0)       --> number
```

If we want to distinguish between floats and intergers, the `type` function of the `math` module  can be used.
```lua
math.type(1)    --> integer
math.type(2.0)  --> float
```

## Comparsion

Integers and floats with the same value compare as equal:
```lua
1 == 1.0        --> true
-2 == -2.0      --> true
0.3e3 == 300    --> true
```

## Arithmetic

Lua supports the usual set of arithmetic operators: additon, subtraction, muliplication, divison and negation. Additional it supports floor division, modulo and exponentiation.

### Addition, substraction, multiplication and negation

If both operands are integer the result of the operations is an integer. The same applies to floats.
```lua
1 + 2     --> 3
1.0 + 2.0 --> 3.0
```

If one operand is a float, the remaining integers will be converted to floats as well and the operations results in a float.
```lua
1.0 + 2   --> 3.0
```

### Division

Division always operates on floats and gives floats as a result.
```lua
1.0 / 2.0 --> 0.5
2 / 1     --> 2.0
```

Dividing by zero will result in `inf` or `-inf`. Dividing zero by zero will result in `-nan`.
```lua
1 / 0     --> inf
-1 / 0    --> -inf
0 / 0     --> -nan
```

### Floor Divison

If an integer result is needed, floor division can be used, which always rounds the quotient towards minus infinity, ensuring an integral result for all operands.

~~~exercism/note
Before version 5.3, Lua had no arithmetic operator for floor division.
~~~

```lua
3 // 2    --> 1
6 // 2    --> 3
```

Floor divison follows the same rules of the addition, substraction, multiplication and negation operators - if both operators are integers the result of the operation is an integer, otherwise the result is a float.

```lua
3.0 // 2   --> 1.0
6.0 // 2.0 --> 3.0
```

When dividing by zero using floor division, Lua will raise an error.
```lua
3 // 0     --> stdin:1: attempt to divide by zero
```

### Modulus

Modulus is used to get the remainder of the division of two operands.
```lua
8 % 2      --> 0
13 % 9     --> 4
0.3 % 0.2  --> 0.1
```

### Exponentiation

Like division, exponentiation also operates on floats and gives floats as results.
```lua
10 ^ 2    --> 100.0
```

## Precedence

All operations are evaluated according to the [operator precedence](https://www.lua.org/manual/5.4/manual.html#3.4.8). Parentheses can be used to change the precedences of an expression.

```lua
1 + 2 * 3   --> 7
(1 + 2) * 3 --> 9
```

## Rounding

The `math` module provides three rounding functions: `floor`, `ceil` rounds towards plus infinite and `modf` rounds towards zero.

### `math.floor`

`floor` rounds towards minus infinite.
```lua
math.floor(1.3)    --> 1
math.floor(-1.3)   --> -2
```

### `math.ceil`

`floor` rounds towards plus infinite.
```lua
math.ceil(1.3)    --> 2
math.ceil(-1.3)   --> -1
```

### `math.modf`

`modf` rounds towards zero. The function returns the rounded value as well as the fractional part of the number, which is always a float.
```lua
math.modf(1.3)    --> 1    0.3
math.modf(-1.3)   --> -1   -0.3
```

## Conversion

If we want to convert an integer to a float, we can add `0.0` to it.
```lua
1 + 0.0         --> 1.0
```

If we want to convert a float to an integer, we can OR it with zero or use the `tointeger` function from the `math` module.
```lua
1.0 | 0              --> 1
math.tointeger(1.0)  --> 1
```

If the number cannot be converted to an integer the OR method will raise an error and the `tointeger` function will return `nil`.
```lua
1.1 | 0              --> stdin:1: number has no integer representation
math.tointeger(1.1)  --> nil
```

## Hexadecimal

Like many other programming languages, Lua supports hexadecimal numbers by prefixing them with `0x`, but unlike many other programming languages, Lua supports also floating-point hexadecimal numbers. They can have a fractional part and a binary exponent, prefixed by 'p' or 'P'.
```lua
0xff            --> 255
0x0.2           --> 0.125
0x3p-1          --> 1.5
0xa.bp2         --> 42.75
```
