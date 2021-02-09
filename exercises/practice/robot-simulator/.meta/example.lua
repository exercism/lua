local commands = {
  R = {
    north = function(self) self.heading = 'east' end,
    east = function(self) self.heading = 'south' end,
    south = function(self) self.heading = 'west' end,
    west = function(self) self.heading = 'north' end
  },
  L = {
    north = function(self) self.heading = 'west' end,
    west = function(self) self.heading = 'south' end,
    south = function(self) self.heading = 'east' end,
    east = function(self) self.heading = 'north' end
  },
  A = {
    north = function(self) self.y = self.y + 1 end,
    east = function(self) self.x = self.x + 1 end,
    south = function(self) self.y = self.y - 1 end,
    west = function(self) self.x = self.x - 1 end
  }
}

local function move(self, command_chain)
  for command in command_chain:gmatch('.') do
    commands[command][self.heading](self)
  end
end

return function(config)
  return {
    x = config.x,
    y = config.y,
    heading = config.heading,
    move = move
  }
end
