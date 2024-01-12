local sieve = require('sieve')

-- LuaFormatter off
describe('sieve', function()
  local select = select or function(n, ...)
    return table.pack(...)[n]
  end

  local function primes_from(co)
    local primes = {}
    while true do
      local _, prime = coroutine.resume(co)
      if prime == nil then
        return primes
      end
      table.insert(primes, prime)
    end
  end

  it('should return a coroutine that generates primes', function()
    local co = sieve(9)
    assert.equal(2, select(2, coroutine.resume(co)))
    assert.equal(3, select(2, coroutine.resume(co)))
    assert.equal(5, select(2, coroutine.resume(co)))
    assert.equal(7, select(2, coroutine.resume(co)))
    assert.is_nil(select(2, coroutine.resume(co)))
  end)

  it('should find primes up to 10', function()
    assert.same({ 2, 3, 5, 7 }, primes_from(sieve(10)))
  end)

  it('should find primes up to 1000', function()
    assert.same(
      { 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997 },
      primes_from(sieve(1000))
    )
  end)

  it('should include the limit if it is prime', function()
    assert.same({ 2, 3, 5, 7, 11, 13 }, primes_from(sieve(13)))
  end)

  it('should find the first prime', function()
    assert.same({ 2 }, primes_from(sieve(2)))
  end)

  it('should not find any primes under 2', function()
    assert.same({}, primes_from(sieve(1)))
  end)
end)
-- LuaFormatter on
