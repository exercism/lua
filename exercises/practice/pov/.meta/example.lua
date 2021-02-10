local name = 1
local children = 2

local function ancestry(which, node)
  if which == node[name] then return { node } end

  for _, child in ipairs(node[children] or {}) do
    local _ancestry = ancestry(which, child)
    if _ancestry then
      table.insert(_ancestry, 1, node)
      return _ancestry
    end
  end
end

local function add_child(node, child)
  node[children] = node[children] or {}
  table.insert(node[children], child)
end

local function remove_child(node, which)
  for i, child in ipairs(node[children]) do
    if which == child then
      table.remove(node[children], i)
      if #node[children] == 0 then node[children] = nil end
    end
  end
end

local function clone_tree(tree)
  local clone = {}
  for k, v in pairs(tree) do
    if type(v) == 'table' then
      clone[k] = clone_tree(v)
    else
      clone[k] = v
    end
  end
  return clone
end

local function pov_from(node_name)
  return {
    of = function(tree)
      tree = clone_tree(tree)
      local ancestry = ancestry(node_name, tree)
      for i = 1, #ancestry - 1 do
        remove_child(ancestry[i], ancestry[i + 1])
        add_child(ancestry[i + 1], ancestry[i])
      end
      return ancestry[#ancestry]
    end
  }
end

local function path_from(source)
  return {
    to = function(destination)
      return {
        of = function(tree)
          local ancestry = ancestry(destination, pov_from(source).of(tree))
          local path = {}
          for _, node in ipairs(ancestry) do
            table.insert(path, node[name])
          end
          return path
        end
      }
    end
  }
end

return {
  pov_from = pov_from,
  path_from = path_from
}
