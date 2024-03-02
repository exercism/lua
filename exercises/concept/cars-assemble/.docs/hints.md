# Hints

## 1. Calculate the number of working cars produced per hour

* The percentage (passed as an argument) is a number between 0-100. To make this percentage a bit easier to work with, start by dividing it by 100.
* To compute the number of cars produced successfully, multiply the percentage (divided by 100) by the number of cars produced.

## 2. Calculate the number of working cars produced per minute

* Start by calculating the production of successful cars per hour. For this, you can use the `calculate_working_cars_per_hour` function you wrote previously.
* Knowing the production per hour of cars, you can get the production per minute by dividing the production per hour by 60 (the number of minutes in an hour).
* Since the returned number should be an integer the [floor division operator](https://www.lua.org/manual/5.4/manual.html#3.4.1) can be useful for this.

## 3. Calculate the cost of production

* Start by working out how many groups of 10 cars there are. You can do this by dividing the number of cars by 10.
* Then work out how many cars are remaining (the [modulo operator](https://www.lua.org/manual/5.4/manual.html#3.4.1) is useful for this).
* To get the total cost, multiply the number of groups by the cost to produce 10 cars and then multiply the number of cars remaining by the cost to produce each individual car. Then sum the results of the multiplication together.
