local triplets_with_sum = require('pythagorean-triplet')

describe('pythagorean-triplet', function()
  local function sort(triplets)
    table.sort(triplets, function(a, b) return a[1] < b[1] end)
    return triplets
  end

  describe('triplets_with_sum', function()
    it('finds triplets whose sum is 12', function()
      assert.same(
        { { 3, 4, 5 } },
        sort(triplets_with_sum(12))
      )
    end)

    it('finds triplets whose sum is 108', function()
      assert.same(
        { { 27, 36, 45 } },
        sort(triplets_with_sum(108))
      )
    end)

    it('finds triplets whose sum is 1000', function()
      assert.same(
        { { 200, 375, 425 } },
        sort(triplets_with_sum(1000))
      )
    end)

    it('finds no triplets whose sum is 1001', function()
      assert.same({}, triplets_with_sum(1001))
    end)

    it('finds triplets whose sum is 90', function()
      assert.same(
        {
          { 9, 40, 41 },
          { 15, 36, 39 },
        },
        sort(triplets_with_sum(90))
      )
    end)

    it('finds triplets whose sum is 840', function()
      assert.same(
        {
          { 40, 399, 401 },
          { 56, 390, 394 },
          { 105, 360, 375 },
          { 120, 350, 370 },
          { 140, 336, 364 },
          { 168, 315, 357 },
          { 210, 280, 350 },
          { 240, 252, 348 },
        },
        sort(triplets_with_sum(840))
      )
    end)

    it('finds triplets whose sum is a large number (30000)', function()
      assert.same(
        {
          { 1200, 14375, 14425 },
          { 1875, 14000, 14125 },
          { 5000, 12000, 13000 },
          { 6000, 11250, 12750 },
          { 7500, 10000, 12500 },
        },
        sort(triplets_with_sum(30000))
      )
    end)
  end)
end)
