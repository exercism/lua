Hamming = {}

function Hamming.compute(a,b) 
  local distance = 0
  for i=0,math.min(a:len(),b:len()) do
    if (a:sub(i,i) ~= b:sub(i,i) ) then 
      distance= distance+1
    end  
  end
  return distance
end

return Hamming