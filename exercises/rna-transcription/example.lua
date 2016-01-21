local toRna = function (dna) 
  local complements = {C="G", G="C", T="A",A="U"} 
  rna = ""
  for i=1,#dna do
    rna = rna..complements[dna:sub(i,i)]
  end
  return rna
end

return toRna