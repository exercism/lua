local cars = {}

function cars.calculate_working_cars_per_hour(production_rate, success_rate)
  return production_rate * success_rate / 100
end

function cars.calculate_working_cars_per_minute(production_rate, success_rate)
  return cars.calculate_working_cars_per_hour(production_rate, success_rate) // 60
end

function cars.calculate_cost(cars_count)
  return (cars_count // 10) * 95000 + (cars_count % 10) * 10000
end

return cars
