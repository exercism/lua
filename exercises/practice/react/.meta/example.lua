local function InputCell(value)
  local children = {}

  return {
    get_value = function()
      return value
    end,

    set_value = function(new_value)
      value = new_value
      for _, child in ipairs(children) do
        child._propagate()
      end
      for _, child in ipairs(children) do
        child._update()
      end
    end,

    _add_child = function(child)
      table.insert(children, child)
    end
  }
end

local function ComputeCell(...)
  local callbacks = {}
  local children = {}
  local value
  local previous_value
  local cell = {}

  local inputs, f do
    local args = table.pack(...)
    if args.n == 3 then
      inputs = { args[1], args[2] }
      f = args[3]
    else
      inputs = { args[1] }
      f = args[2]
    end
  end

  local function calculate_value()
    local args = {}
    for _, input in ipairs(inputs) do
      table.insert(args, input.get_value())
    end
    return f(table.unpack(args))
  end

  function cell.get_value()
    return value
  end

  function cell.watch(callback)
    table.insert(callbacks, callback)
  end

  function cell.unwatch(callback)
    for i, _callback in ipairs(callbacks) do
      if callback == _callback then
        table.remove(callbacks, i)
        return
      end
    end
  end

  function cell._propagate()
    value = calculate_value()
    for _, child in ipairs(children) do
      child._propagate()
    end
  end

  function cell._update()
    if previous_value ~= value then
      previous_value = value
      for _, callback in ipairs(callbacks) do
        callback(value)
      end
    end
    for _, child in ipairs(children) do
      child._update()
    end
  end

  function cell._add_child(child)
    table.insert(children, child)
  end

  value = calculate_value()
  previous_value = value

  for _, input in ipairs(inputs) do
    input._add_child(cell)
  end

  return cell
end

local function Reactor()
  return {
    InputCell = InputCell,
    ComputeCell = ComputeCell
  }
end

return { Reactor = Reactor }
