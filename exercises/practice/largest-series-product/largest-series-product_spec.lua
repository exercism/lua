local lsp = require('largest-series-product')

describe('largest-series-product', function()
  it('should be able to find the largest product of 2 with ordered digits', function()
    assert.equals(72, lsp({ digits = '0123456789', span = 2 }))
  end)

  it('should be able to find the largest product of 2 with unordered digits', function()
    assert.equals(48, lsp({ digits = '576802143', span = 2 }))
  end)

  it('should be able to find the largest product when the span is the same as the digit count', function()
    assert.equals(18, lsp({ digits = '29', span = 2 }))
  end)

  it('should be able to find the largest product of 3 with ordered digits', function()
    assert.equals(504, lsp({ digits = '0123456789', span = 3 }))
  end)

  it('should be able to find the largest product of 3 with unordered digits', function()
    assert.equals(270, lsp({ digits = '1027839564', span = 3 }))
  end)

  it('should be able to get the largest product with a large span', function()
    assert.equals(23520, lsp({
      digits = '73167176531330624919225119674426574742355349194934',
      span = 6
    }))
  end)

  it('should be able to get the largest product with a really large span', function()
    assert.equals(23514624000, lsp({
      digits = '7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450',
      span = 13
    }))
  end)

  it('should yield a largest product of 0 if all digits are 0', function()
    assert.equals(0, lsp({ digits = '0000', span = 2 }))
  end)

  it('should yield a largest product of 0 if all spans include 0', function()
    assert.equals(0, lsp({ digits = '99099', span = 3 }))
  end)

  it('should yield 1 for no digits and 0 span', function()
    assert.equals(1, lsp({ digits = '', span = 0 }))
  end)

  it('should yield 1 for non-empty digits and 0 span', function()
    assert.equals(1, lsp({ digits = '123', span = 0 }))
  end)

  it('should reject spans larger than the string length', function()
    assert.has_error(function()
      lsp({ digits = '123', span = 4 })
    end)
  end)

  it('should reject no digits and non-zero span', function()
    assert.has_error(function()
      lsp({ digits = '', span = 1 })
    end)
  end)

  it('should reject negative spans', function()
    assert.has_error(function()
      lsp({ digits = '12345', span = -1 })
    end)
  end)

  it('should reject invalid digits', function()
    assert.has_error(function()
      lsp({ digits = '1234a5', span = 2 })
    end)
  end)
end)
