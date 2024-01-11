local two_bucket = require 'two-bucket'

-- LuaFormatter off
describe('two-bucket', function()
  it('measure using bucket one of size 3 and bucket two of size 5 - start with bucket one', function()
    assert.are.same(two_bucket.measure({
      bucket_one_capacity = 3,
      bucket_two_capacity = 5,
      goal_volume = 1,
      start_bucket = 1
    }), {
      moves = 4,
      other_bucket_volume = 5,
      goal_bucket_number = 1
    })
  end)

  it('measure using bucket one of size 3 and bucket two of size 5 - start with bucket two', function()
    assert.are.same(two_bucket.measure({
      bucket_one_capacity = 3,
      bucket_two_capacity = 5,
      goal_volume = 1,
      start_bucket = 2
    }), {
      moves = 8,
      other_bucket_volume = 3,
      goal_bucket_number = 2
    })
  end)

  it('measure using bucket one of size 7 and bucket two of size 11 - start with bucket one', function()
    assert.are.same(two_bucket.measure({
      bucket_one_capacity = 7,
      bucket_two_capacity = 11,
      goal_volume = 2,
      start_bucket = 1
    }), {
      moves = 14,
      other_bucket_volume = 11,
      goal_bucket_number = 1
    })
  end)

  it('measure using bucket one of size 7 and bucket two of size 11 - start with bucket two', function()
    assert.are.same(two_bucket.measure({
      bucket_one_capacity = 7,
      bucket_two_capacity = 11,
      goal_volume = 2,
      start_bucket = 2
    }), {
      moves = 18,
      other_bucket_volume = 7,
      goal_bucket_number = 2
    })
  end)

  it('measure one step using bucket one of size 1 and bucket two of size 3 - start with bucket two', function()
    assert.are.same(two_bucket.measure({
      bucket_one_capacity = 1,
      bucket_two_capacity = 3,
      goal_volume = 3,
      start_bucket = 2
    }), {
      moves = 1,
      other_bucket_volume = 0,
      goal_bucket_number = 2
    })
  end)

  it('measure using bucket one of size 2 and bucket two of size 3 - start with bucket one and end with bucket two', function()
    assert.are.same(two_bucket.measure({
      bucket_one_capacity = 2,
      bucket_two_capacity = 3,
      goal_volume = 3,
      start_bucket = 1
    }), {
      moves = 2,
      other_bucket_volume = 2,
      goal_bucket_number = 2
    })
  end)

  it('not possible to reach the goal', function()
    assert.has_error(function()
      two_bucket.measure({
        bucket_one_capacity = 6,
        bucket_two_capacity = 15,
        goal_volume = 5,
        start_bucket = 1
      })
    end)
  end)

  it('with the same buckets but a different goal, then it is possible', function()
    assert.are.same(two_bucket.measure({
      bucket_one_capacity = 6,
      bucket_two_capacity = 15,
      goal_volume = 9,
      start_bucket = 1
    }), {
      moves = 10,
      other_bucket_volume = 0,
      goal_bucket_number = 2
    })
  end)

  it('goal larger than both buckets is impossible', function()
    assert.has_error(function()
      two_bucket.measure({
        bucket_one_capacity = 5,
        bucket_two_capacity = 7,
        goal_volume = 8,
        start_bucket = 1
      })
    end)
  end)
end)
-- LuaFormatter on
