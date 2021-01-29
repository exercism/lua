return function(pos)
  assert(pos.row >= 0, 'row must be positive')
  assert(pos.row < 8, 'row must be on the board')
  assert(pos.column >= 0, 'column must be positive')
  assert(pos.column < 8, 'column must be on the board')

  return {
    row = pos.row,
    column = pos.column,
    can_attack = function(other)
      local row_difference = math.abs(pos.row - other.row)
      local column_difference = math.abs(pos.column - other.column)

      local same_row = row_difference == 0
      local same_column = column_difference == 0
      local diagonal = row_difference == column_difference

      return same_row or same_column or diagonal
    end
  }
end
