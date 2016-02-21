local pythagorean = require('pythagorean-triplet')

describe('pythagorean-triplet', function()
  local function sort(triplets)
    table.sort(triplets, function(a, b) return a[1] < b[1] end)
    return triplets
  end

  describe('is_triplet', function()
    it('should identify triplets', function()
      assert.is_true(pythagorean.is_triplet(3, 4, 5))
      assert.is_true(pythagorean.is_triplet(5, 12, 13))
    end)

    it('should identify non-triplets', function()
      assert.is_false(pythagorean.is_triplet(3, 4, 6))
      assert.is_false(pythagorean.is_triplet(5, 6, 17))
    end)
  end)

  describe('triplets_with', function()
    it('should generate all triplets with a specified maximum factor', function()
      assert.same(
        { { 3, 4, 5 },  { 5, 12, 13 }, { 6, 8, 10 }, { 8, 15, 17}, { 9, 12, 15 } },
        sort(pythagorean.triplets_with{ max_factor = 17 })
      )
    end)

    it('should generate all triplets with a specified minimum and maximum factor', function()
      assert.same(
        { { 6, 8, 10 }, { 9, 12, 15 } },
        sort(pythagorean.triplets_with{ min_factor = 6, max_factor = 15 })
      )
    end)

    it('should generate all triplets with a specified maximum factor and a specified sum', function()
      assert.same(
        { { 18, 80, 82 }, { 30, 72, 78 }, { 45, 60, 75 } },
        sort(pythagorean.triplets_with{ sum = 180, max_factor = 100 })
      )
    end)
  end)
end)
