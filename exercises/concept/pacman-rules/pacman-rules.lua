local rules = {}

-- returns if Pac-Man was able to eat the ghost or not
function rules.eat_ghost(power_pellet_active, touching_ghost)
  -- eat_ghost body
end

-- returns if Pac-Man ate a power pellet or a dot
function rules.score(touching_power_pellet, touching_dot)
  -- score body
end

-- returns if Pac-Man lost by touching a ghost without a power pellet
function rules.lose(power_pellet_active, touching_ghost)
  -- lose body
end

-- returns if Pac-Man won by eating all dots and has not touched a ghost without a power pellet
function rules.win(has_eaten_all_dots, power_pellet_active, touching_ghost)
  -- win body
end

return rules
