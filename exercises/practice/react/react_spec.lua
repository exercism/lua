local react = require('react')

describe('react', function()
  it('input cells have a value', function()
    local r = react.Reactor()
    local input = r.InputCell(2)

    assert.are.equal(2, input.get_value())
  end)

  it("an input cell's value can be set", function()
    local r = react.Reactor()
    local input = r.InputCell(4)

    input.set_value(20)
    assert.are.equal(20, input.get_value())
  end)

  it('compute cells calculate initial value', function()
    local r = react.Reactor()
    local input = r.InputCell(1)
    local output = r.ComputeCell(input, function(x) return x + 1 end)

    assert.are.equal(2, output.get_value())
  end)

  it('compute cells take inputs in the right order', function()
    local r = react.Reactor()
    local one = r.InputCell(1)
    local two = r.InputCell(2)
    local output = r.ComputeCell(one, two, function(x, y) return x + y * 10 end)

    assert.are.equal(21, output.get_value())
  end)

  it('compute cells update value when dependencies are changed', function()
    local r = react.Reactor()
    local input = r.InputCell(1)
    local output = r.ComputeCell(input, function(x) return x + 1 end)

    input.set_value(3)
    assert.are.equal(4, output.get_value())
  end)

  it('compute cells can depend on other compute cells', function()
    local r = react.Reactor()
    local input = r.InputCell(1)
    local times_two = r.ComputeCell(input, function(x) return x * 2 end)
    local times_thirty = r.ComputeCell(input, function(x) return x * 30 end)
    local output = r.ComputeCell(times_two, times_thirty, function(x, y) return x + y end)

    assert.are.equal(32, output.get_value())

    input.set_value(3)
    assert.are.equal(96, output.get_value())
  end)

  it('compute cells fire callbacks', function()
    local r = react.Reactor()
    local input = r.InputCell(1)
    local output = r.ComputeCell(input, function(x) return x + 1 end)
    local callback = spy.new(function() end)

    output.watch(callback)
    input.set_value(3)
    assert.spy(callback).was_called(1)
    assert.spy(callback).was_called_with(4)
  end)

  it('callbacks only fire on change', function()
    local r = react.Reactor()
    local input = r.InputCell(1)
    local output = r.ComputeCell(input, function(x)
      if x < 3 then
        return 111
      else
        return 222
      end
    end)
    local callback = spy.new(function() end)

    output.watch(callback)

    input.set_value(2)
    assert.spy(callback).was_called(0)

    input.set_value(4)
    assert.spy(callback).was_called(1)
    assert.spy(callback).was_called_with(222)
  end)

  it('callbacks can be added and removed', function()
    local r = react.Reactor()
    local input = r.InputCell(11)
    local output = r.ComputeCell(input, function(x) return x + 1 end)
    local callback1 = spy.new(function() end)
    local callback2 = spy.new(function() end)
    local callback3 = spy.new(function() end)

    output.watch(callback1)
    output.watch(callback2)
    input.set_value(31)

    output.unwatch(callback1)
    output.watch(callback3)
    input.set_value(41)

    assert.spy(callback1).was_called(1)
    assert.spy(callback1).was_called_with(32)
    assert.spy(callback2).was_called(2)
    assert.spy(callback2).was_called_with(42)
    assert.spy(callback3).was_called(1)
    assert.spy(callback3).was_called_with(42)
  end)

  it("removing a callback multiple times doesn't interfere with other callbacks", function()
    local r = react.Reactor()
    local input = r.InputCell(1)
    local output = r.ComputeCell(input, function(x) return x + 1 end)
    local callback1 = spy.new(function() end)
    local callback2 = spy.new(function() end)

    output.watch(callback1)
    output.watch(callback2)
    for i = 1, 10 do output.unwatch(callback1) end
    input.set_value(2)

    assert.spy(callback1).was_called(0)
    assert.spy(callback2).was_called(1)
    assert.spy(callback2).was_called_with(3)
  end)

  it('callbacks only called once even if multiple inputs change', function()
    local r = react.Reactor()
    local input = r.InputCell(1)
    local plus_one = r.ComputeCell(input, function(x) return x + 1 end)
    local minus_one1 = r.ComputeCell(input, function(x) return x - 1 end)
    local minus_one2 = r.ComputeCell(minus_one1, function(x) return x - 1 end)
    local output = r.ComputeCell(plus_one, minus_one2, function(x, y) return x * y end)
    local callback = spy.new(function() end)

    output.watch(callback)
    input.set_value(4)
    assert.spy(callback).was_called(1)
    assert.spy(callback).was_called_with(10)
  end)

  it("callbacks not called if inputs change but output doesn't", function()
    local r = react.Reactor()
    local input = r.InputCell(1)
    local plus_one = r.ComputeCell(input, function(x) return x + 1 end)
    local minus_one = r.ComputeCell(input, function(x) return x - 1 end)
    local always_two = r.ComputeCell(plus_one, minus_one, function(x, y) return x - y end)
    local callback = spy.new(function() end)

    always_two.watch(callback)
    for i = 1, 10 do input.set_value(i) end
    assert.spy(callback).was_called(0)
  end)
end)
