local TwoFer = {}

function TwoFer.two_fer(name)
    local val = name or 'you'
    return string.format('One for %s, one for me.', val)
end

return TwoFer
