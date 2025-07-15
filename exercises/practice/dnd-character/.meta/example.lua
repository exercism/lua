local function roll_dice()
  return { math.random(6), math.random(6), math.random(6), math.random(6) }
end

local function ability()
  local scores = roll_dice()
  local total = 0
  local smallest = 6
  for _, score in ipairs(scores) do
    total = total + score
    if score < smallest then
      smallest = score
    end
  end
  return total - smallest
end

local function modifier(input)
  return (input - 10) // 2
end

local Character = {}

function Character:new(name)
  self.__index = self
  local meta_tbl = {
    name = name,
    strength = ability(),
    dexterity = ability(),
    constitution = ability(),
    intelligence = ability(),
    wisdom = ability(),
    charisma = ability()
  }
  meta_tbl.hitpoints = 10 + modifier(meta_tbl.constitution)

  return setmetatable(meta_tbl, self)
end

return { Character = Character, ability = ability, modifier = modifier }
