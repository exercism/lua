```lua
local Robot = {}
Robot.__index = Robot
function Robot:new(attributes)
  local robot = { name = attributes.name or "Anonymous" }
  return setmetatable(robot, self)
end
```
