function divisible_5_p(num)
   if num%5 == 0 then
      return true
   else
      return false
   end
end

function divisible_3_p(num)
   if num%3 == 0 then
      return true
   else
      return false
   end
end

function divisible(num)
   if divisible_5_p(num) or divisible_3_p(num) then
      return true
   else
      return false
   end
end

function filter(pred, list_of_elems)
   local values = {}
   local result = false
   for i = 1, #list_of_elems do
      result = pred(list_of_elems[i])
      if result == true then
	 values[i] = list_of_elems[i]
      end
   end
   return values
end

function sum_m_53(list_of_numbers)
   local cont = 0
   local len = #list_of_numbers
   local list_filtered = filter(divisible, list_of_numbers)
   for i = 1, len do
      if list_filtered[i] == nil then
	 cont = 0 + cont
      else
	 cont = list_filtered[i] + cont
      end
   end
   return cont
end
