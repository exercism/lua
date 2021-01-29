local accumulate = require('accumulate')

describe('accumulate', function()
  local function square(x) return x * x end

  it('should accumulate over an empty array', function()
    assert.are.same({}, accumulate({}, square))
  end)

  it('should accumulate over an array with a single element', function()
    assert.are.same({ 4 }, accumulate({ 2 }, square))
  end)

  it('should accumulate over an array with several elements', function()
    assert.are.same({ 1, 4, 9 }, accumulate({ 1, 2, 3 }, square))
  end)

  it('should accumulate over an array with a different function', function()
    assert.are.same({ 'HELLO', 'WORLD' }, accumulate({ 'hello', 'world' }, string.upper))
  end)

  it('should not modify the input array', function()
    local input = { 1, 2, 3 }
    accumulate(input, square)
    assert.are.same({ 1, 2, 3 }, input)
  end)
end)
