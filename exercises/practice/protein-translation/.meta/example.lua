local codon_to_protein = {
  AUG = 'Methionine',
  UUC = 'Phenylalanine',
  UUU = 'Phenylalanine',
  UUA = 'Leucine',
  UUG = 'Leucine',
  UCU = 'Serine',
  UCC = 'Serine',
  UCA = 'Serine',
  UCG = 'Serine',
  UAU = 'Tyrosine',
  UAC = 'Tyrosine',
  UGU = 'Cysteine',
  UGC = 'Cysteine',
  UGG = 'Tryptophan',
  UAA = 'STOP',
  UAG = 'STOP',
  UGA = 'STOP'
}

local function protein_for_codon(codon)
  local protein = codon_to_protein[codon]
  assert(protein ~= nil, 'Unknown codon')
  return protein
end

local function proteins(strand)
  local proteins = {}
  for codon in strand:gmatch('...') do
    local protein = protein_for_codon(codon)
    if protein == 'STOP' then
      break
    end
    table.insert(proteins, protein)
  end
  return proteins
end

return { proteins = proteins }
