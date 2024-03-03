local rules = {}

function rules.eat_ghost(power_pellet_active, touching_ghost)
  return power_pellet_active and touching_ghost
end

function rules.score(touching_power_pellet, touching_dot)
  return touching_power_pellet or touching_dot
end

function rules.lose(power_pellet_active, touching_ghost)
  return not power_pellet_active and touching_ghost
end

function rules.win(has_eaten_all_dots, power_pellet_active, touching_ghost)
  return has_eaten_all_dots and not rules.lose(power_pellet_active, touching_ghost)
end

return rules
