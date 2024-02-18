local lasagna = {}

lasagna.oven_time = 40

function lasagna.remaining_oven_time(actual_minutes_in_oven)
    return lasagna.oven_time - actual_minutes_in_oven
end

function lasagna.preparation_time(number_of_layers)
    return number_of_layers * 2
end

function lasagna.elapsed_time(number_of_layers, actual_minutes_in_oven)
    return actual_minutes_in_oven + lasagna.preparation_time(number_of_layers)
end

return lasagna
