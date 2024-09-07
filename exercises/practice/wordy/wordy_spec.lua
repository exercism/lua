local wordy = require('wordy')

describe('wordy', function()
  it('just a number', function()
    assert.are.same(5, wordy.answer('What is 5?'))
  end)

  it('addition', function()
    assert.are.same(2, wordy.answer('What is 1 plus 1?'))
  end)

  it('more addition', function()
    assert.are.same(55, wordy.answer('What is 53 plus 2?'))
  end)

  it('addition with negative numbers', function()
    assert.are.same(-11, wordy.answer('What is -1 plus -10?'))
  end)

  it('large addition', function()
    assert.are.same(45801, wordy.answer('What is 123 plus 45678?'))
  end)

  it('subtraction', function()
    assert.are.same(16, wordy.answer('What is 4 minus -12?'))
  end)

  it('multiplication', function()
    assert.are.same(-75, wordy.answer('What is -3 multiplied by 25?'))
  end)

  it('division', function()
    assert.are.same(-11, wordy.answer('What is 33 divided by -3?'))
  end)

  it('multiple additions', function()
    assert.are.same(3, wordy.answer('What is 1 plus 1 plus 1?'))
  end)

  it('addition and subtraction', function()
    assert.are.same(8, wordy.answer('What is 1 plus 5 minus -2?'))
  end)

  it('multiple subtraction', function()
    assert.are.same(3, wordy.answer('What is 20 minus 4 minus 13?'))
  end)

  it('subtraction then addition', function()
    assert.are.same(14, wordy.answer('What is 17 minus 6 plus 3?'))
  end)

  it('multiple multiplication', function()
    assert.are.same(-12, wordy.answer('What is 2 multiplied by -2 multiplied by 3?'))
  end)

  it('addition and multiplication', function()
    assert.are.same(-8, wordy.answer('What is -3 plus 7 multiplied by -2?'))
  end)

  it('multiple division', function()
    assert.are.same(2, wordy.answer('What is -12 divided by 2 divided by -3?'))
  end)

  it('unknown operation', function()
    assert.has_error(function()
      wordy.answer('What is 52 cubed?')
    end, 'Invalid question')
  end)

  it('Non math question', function()
    assert.has_error(function()
      wordy.answer('Who is the President of the United States?')
    end, 'Invalid question')
  end)

  it('reject problem missing an operand', function()
    assert.has_error(function()
      wordy.answer('What is 1 plus?')
    end, 'Invalid question')
  end)

  it('reject problem with no operands or operators', function()
    assert.has_error(function()
      wordy.answer('What is?')
    end, 'Invalid question')
  end)

  it('reject two operations in a row', function()
    assert.has_error(function()
      wordy.answer('What is 1 plus plus 2?')
    end, 'Invalid question')
  end)

  it('reject two numbers in a row', function()
    assert.has_error(function()
      wordy.answer('What is 1 plus 2 1?')
    end, 'Invalid question')
  end)

  it('reject postfix notation', function()
    assert.has_error(function()
      wordy.answer('What is 1 2 plus?')
    end, 'Invalid question')
  end)

  it('reject prefix notation', function()
    assert.has_error(function()
      wordy.answer('What is plus 1 2?')
    end, 'Invalid question')
  end)
end)
