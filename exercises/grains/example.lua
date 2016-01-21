local Grains = {}

function Grains.square(n)
    return (1 << (n - 1))
end

function Grains.total()
    local sum = 0
    for i = 1, 64 do
        sum = sum + Grains.square(i)
    end
    return sum
end

return Grains
