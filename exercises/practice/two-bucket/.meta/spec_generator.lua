return {
  module_name = 'two_bucket',

  generate_test = function(case)
    if case.expected.error then
      local template = [[
        assert.has_error(function()
          two_bucket.measure({
            bucket_one_capacity = %d, --
            bucket_two_capacity = %d, --
            goal_volume = %d, --
            start_bucket = %d --
          })
        end)]]

      return template:format(case.input.bucketOne, case.input.bucketTwo, case.input.goal,
                             case.input.startBucket == 'one' and 1 or 2)
    else
      local template = [[
        assert.are.same(two_bucket.measure({
          bucket_one_capacity = %d, --
          bucket_two_capacity = %d, --
          goal_volume = %d, --
          start_bucket = %d --
        }), {
          moves = %d, --
          other_bucket_volume = %d, --
          goal_bucket_number = %d --
        })]]

      return template:format(case.input.bucketOne, case.input.bucketTwo, case.input.goal,
                             case.input.startBucket == 'one' and 1 or 2, case.expected.moves, case.expected.otherBucket,
                             case.expected.goalBucket == 'one' and 1 or 2)
    end
  end
}
