local hello_world = {}

function hello_world.hello( name )
  if not name or name == '' then name = 'world' end
  return 'Hello, ' .. name .. '!'
end

return hello_world
