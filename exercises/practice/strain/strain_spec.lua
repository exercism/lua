local keep = require('strain').keep
local discard = require('strain').discard

-- LuaFormatter off
describe('strain', function()
  local function always_true()
    return true
  end
  local function always_false()
    return false
  end
  local function is_even(x)
    return x % 2 == 0
  end
  local function is_odd(x)
    return x % 2 == 1
  end
  local function starts_with_z(s)
    return string.sub(s, 1, 1) == "z"
  end
  local function contains_5(xs)
    for _, x in ipairs(xs) do
      if x == 5 then
        return true
      end
    end
    return false
  end

  describe('keep', function()
    it('keep on empty list returns empty list', function()
      assert.same({}, keep({}, always_true))
    end)

    it('keeps everything', function()
      assert.same({ 1, 3, 5 }, keep({ 1, 3, 5 }, always_true))
    end)

    it('keeps nothing', function()
      assert.same({}, keep({ 1, 3, 5 }, always_false))
    end)

    it('keeps first and last', function()
      assert.same({ 1, 3 }, keep({ 1, 2, 3 }, is_odd))
    end)

    it('keeps neither first nor last', function()
      assert.same({ 2 }, keep({ 1, 2, 3 }, is_even))
    end)

    it('keeps strings', function()
      assert.same({ 'zebra', 'zombies', 'zealot' }, keep({ 'apple', 'zebra', 'banana', 'zombies', 'cherimoya', 'zealot' }, starts_with_z))
    end)

    it('keeps lists', function()
      assert.same({ { 5, 5, 5 }, { 5, 1, 2 }, { 1, 5, 2 }, { 1, 2, 5 } }, keep({ { 1, 2, 3 }, { 5, 5, 5 }, { 5, 1, 2 }, { 2, 1, 2 }, { 1, 5, 2 }, { 2, 2, 1 }, { 1, 2, 5 } }, contains_5))
    end)
  end)

  describe('discard', function()
    it('discard on empty list returns empty list', function()
      assert.same({}, discard({}, always_true))
    end)

    it('discards everything', function()
      assert.same({}, discard({ 1, 3, 5 }, always_true))
    end)

    it('discards nothing', function()
      assert.same({ 1, 3, 5 }, discard({ 1, 3, 5 }, always_false))
    end)

    it('discards first and last', function()
      assert.same({ 2 }, discard({ 1, 2, 3 }, is_odd))
    end)

    it('discards neither first nor last', function()
      assert.same({ 1, 3 }, discard({ 1, 2, 3 }, is_even))
    end)

    it('discards strings', function()
      assert.same({ 'apple', 'banana', 'cherimoya' }, discard({ 'apple', 'zebra', 'banana', 'zombies', 'cherimoya', 'zealot' }, starts_with_z))
    end)

    it('discards lists', function()
      assert.same({ { 1, 2, 3 }, { 2, 1, 2 }, { 2, 2, 1 } }, discard({ { 1, 2, 3 }, { 5, 5, 5 }, { 5, 1, 2 }, { 2, 1, 2 }, { 1, 5, 2 }, { 2, 2, 1 }, { 1, 2, 5 } }, contains_5))
    end)
  end)
end)
-- LuaFormatter on
