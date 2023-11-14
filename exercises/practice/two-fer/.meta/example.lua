local TwoFer = {}

function TwoFer.twoFer(name)
    local val = name or 'you'
    return string.format('One for %s, one for me.', val)
end

return TwoFer
