return {
  transform = function(dataset)
    local transformed = {}
    for k, values in pairs(dataset) do
      for _, v in pairs(values) do
        transformed[v:lower()] = k
      end
    end
    return transformed
  end
}
