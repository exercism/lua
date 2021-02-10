return function(dna)
  local complements = { C = 'G', G = 'C', T = 'A', A = 'U'}
  local rna = ''
  for i = 1, #dna do
    rna = rna .. complements[dna:sub(i, i)]
  end
  return rna
end
