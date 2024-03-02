# Instructions

In this exercise you'll be writing code to analyze an assembly line in a car factory.

## 1. Calculate the number of working cars produced per hour

Implement a function that takes in the number of cars produced per hour and the success rate and calculates the number of successful cars made per hour. The success rate is given as a percentage, from `0` to `100`:

```lua
cars.calculate_working_cars_per_hour(1547, 90)
--> => 1392.3
```

**Note:** the return value should be a float.

## 2. Calculate the number of working cars produced per minute

Implement a function that takes in the number of cars produced per hour and the success rate and calculates how many cars are successfully produced each minute:

```lua
cars.calculate_working_cars_per_minute(1105, 90)
-- => 16
```

**Note:** the return value should be an integer.

## 3. Calculate the cost of production 

Each car normally costs $10.000 to produce individually, regardless of whether it is successful or not. But with a bit of planning, 10 cars can be produced together for $95.000. For example, 37 cars can be produced in the following way:
37 = 3 x groups of ten + 7 individual cars

So the cost for 37 cars is:
3 \* 95,.000 + 7 \* 10.000 = 355.000

Implement a function that calculates the cost of producing a number of cars, regardless of whether they are successful:

```lua
cars.calculate_cost(37)
-- => 355000

cars.calculate_cost(21)
-- => 200000
```

**Note:** the return value should be an integer.
