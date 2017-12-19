def sum_to(n)
  return nil if n < 1
  return 1 if n == 1
  sum_to(n-1) + n
end

def add_numbers(arr)
  return arr.first if arr.length <= 1
  arr.pop + add_numbers(arr)
end

def gamma_fnc(num)
  return nil if num < 1
  return 1 if num == 1
  (num - 1) * gamma_fnc(num - 1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors.last == favorite 

  ice_cream_shop(flavors[0...-1], favorite)
end

def reverse(str)
  return "" if string.empty?
  reverse(str[1..-1]) + str[0]
end
reverse("Hello")
