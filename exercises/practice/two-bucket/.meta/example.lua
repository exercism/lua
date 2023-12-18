local function Bucket(capacity)
  local self = { volume = 0, capacity = capacity }

  self.empty = function()
    self.volume = 0
  end

  self.is_empty = function()
    return self.volume == 0
  end

  self.is_full = function()
    return self.volume == self.capacity
  end

  self.fill = function()
    self.volume = self.capacity
  end

  self.pour_into = function(other)
    local amount = math.min(self.volume, other.remaining())
    self.volume = self.volume - amount
    other.volume = other.volume + amount
  end

  self.remaining = function()
    return self.capacity - self.volume
  end

  self.contains = function(amount)
    return self.volume == amount
  end

  return self
end

return {
  measure = function(args)
    local bucket_one = Bucket(args.bucket_one_capacity)
    local bucket_two = Bucket(args.bucket_two_capacity)
    local goal_volume = args.goal_volume
    local start_bucket = args.start_bucket

    local start = start_bucket == 1 and bucket_one or bucket_two
    local other = start_bucket == 2 and bucket_one or bucket_two

    local previous_states = {}

    local moves = 1
    start.fill()

    while not (start.contains(goal_volume) or other.contains(goal_volume)) do
      local current_state = tostring(start.volume) .. ':' .. tostring(other.volume)
      assert(not previous_states[current_state])
      previous_states[current_state] = true

      moves = moves + 1

      if other.capacity == goal_volume then
        other.fill()
      elseif other.is_full() then
        other.empty()
      elseif not start.is_empty() then
        start.pour_into(other)
      else
        start.fill()
      end
    end

    return {
      moves = moves,
      other_bucket_volume = bucket_one.contains(goal_volume) and bucket_two.volume or bucket_one.volume,
      goal_bucket_number = bucket_one.contains(goal_volume) and 1 or 2
    }
  end
}
