local lasagna = require('lasagna')

describe('lasagna', function()
  it('should have an oven_time field with the correct value', function()
    assert.are.equal(40, lasagna.oven_time)
  end)

  it('should return the remaining minutes in oven', function()
    assert.are.equal(25, lasagna.remaining_oven_time(15))
  end)

  it('should return the time needed to prepare the lasagna', function()
    assert.are.equal(2, lasagna.preparation_time(1))
    assert.are.equal(8, lasagna.preparation_time(4))
  end)

  it('should return the time elapsed cooking the lasagna', function()
    assert.are.equal(32, lasagna.elapsed_time(1, 30))
    assert.are.equal(16, lasagna.elapsed_time(4, 8))
  end)
end)
