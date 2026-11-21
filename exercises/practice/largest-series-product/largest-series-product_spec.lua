local lsp = require('largest-series-product')

describe('largest-series-product', function()
  it('finds the largest product if span equals length', function()
    assert.equal(18, lsp({ digits = '29', span = 2 }))
  end)

  it('can find the largest product of 2 with numbers in order', function()
    assert.equal(72, lsp({ digits = '0123456789', span = 2 }))
  end)

  it('can find the largest product of 2', function()
    assert.equal(48, lsp({ digits = '576802143', span = 2 }))
  end)

  it('can find the largest product of 3 with numbers in order', function()
    assert.equal(504, lsp({ digits = '0123456789', span = 3 }))
  end)

  it('can find the largest product of 3', function()
    assert.equal(270, lsp({ digits = '1027839564', span = 3 }))
  end)

  it('can find the largest product of 5 with numbers in order', function()
    assert.equal(15120, lsp({ digits = '0123456789', span = 5 }))
  end)

  it('can get the largest product of a big number', function()
    assert.equal(23520, lsp({ digits = '73167176531330624919225119674426574742355349194934', span = 6 }))
  end)

  it('reports zero if the only digits are zero', function()
    assert.equal(0, lsp({ digits = '0000', span = 2 }))
  end)

  it('reports zero if all spans include zero', function()
    assert.equal(0, lsp({ digits = '99099', span = 3 }))
  end)

  it('rejects span longer than string length', function()
    assert.has_error(function()
      lsp({ digits = '123', span = 4 })
    end)
  end)

  it('rejects empty string and nonzero span', function()
    assert.has_error(function()
      lsp({ digits = '', span = 1 })
    end)
  end)

  it('rejects invalid character in digits', function()
    assert.has_error(function()
      lsp({ digits = '1234a5', span = 2 })
    end)
  end)

  it('rejects negative span', function()
    assert.has_error(function()
      lsp({ digits = '12345', span = -1 })
    end)
  end)
end)
