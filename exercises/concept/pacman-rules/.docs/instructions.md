# Instructions

In this exercise, you need to implement some rules from the classic game Pac-Man.

You have four rules to implement, all related to the game states.

## 1. Define if Pac-Man eats a ghost

Implement a function that takes in if Pac-Man has a power pellet active and if Pac-Man is touching a ghost and returns a boolean value if Pac-Man is able to eat the ghost. The function should return `true` only if Pac-Man has a power pellet active and is touching a ghost.

```lua
rules.eat_ghost(false, true)
-- => false
```

## 2. Define if Pac-Man scores

Implement a function that takes in if Pac-Man is touching a power pellet and if Pac-Man is touching a dot and returns a boolean value if Pac-Man scored. The function should return `true` if Pac-Man is touching a power pellet or a dot.

```lua
rules.score(true, true)
-- => true
```

## 3. Define if Pac-Man loses

Implement a function that takes in if Pac-Man has a power pellet active and if Pac-Man is touching a ghost and returns a boolean value if Pac-Man loses. The function should return `true` if Pac-Man is touching a ghost and does not have a power pellet active.

```lua
rules.lose(false, true)
-- => true
```

## 4. Define if Pac-Man wins

Implement a function that takes in if Pac-Man has eaten all of the dots, if Pac-Man has a power pellet active and if Pac-Man is touching a ghost and returns a boolean value if Pac-Man wins. The function should return `true` if Pac-Man has eaten all of the dots and has not lost based on the arguments defined in part 3.

```lua
rules.win(false, true, false)
-- => false
```
