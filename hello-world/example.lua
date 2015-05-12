HelloWorld = {}

function HelloWorld.hello( name )
  if not name or name == '' then name = 'world' end
  return 'Hello, ' .. name .. '!'
end

return HelloWorld
