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

function range(start, stop)
   if start >= stop then
      return {0}
   end

   if start < 0 then
      start = 0
   end
   
   temp = {}
   for i = start, stop do
      temp[i] = i
   end
   return temp
end

function sum53(start, stop)
   local cont = 0
   local base_list = range(start, stop)
   local list_filtered = filter(divisible, base_list)

   for i = start, stop do
      if list_filtered[i] == nil then
	 cont = 0 + cont
      else
	 cont = list_filtered[i] + cont
      end
   end
   return cont
end

