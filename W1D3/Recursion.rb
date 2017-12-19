#recursive solution
def range(n1, n2)
  return [] if n1 == n2
  return [n2-1] if n1 == n2-1
  range(n1, n2-1) + [n2-1]
end
range(1, 5)

#iterative solution
def range(n1, n2)
  return nil if n2 > n1
  result = []
  beginning = n1
  while result.length < (n2 - n1)
    result << beginning
    beginning += 1
  end
  result
end
range(1, 5)

#recursive solution
def exp(b, n)
  return 1 if n == 0
  b * exp(b, n - 1)
end

#faster recursive solution
def exp2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    one_step_below = exp2(b, n/2)
    one_step_below * one_step_below
  else
    one_step_below = (exp2(b, (n - 1) / 2))
    b * one_step_below * one_step_below
  end
end

class Array
  def deep_dup
    return [] if self.length < 1
    result = []
    self.each do |el|
      if el.is_a?(Array)
        result << (el.deep_dup)
      else
        result << el
      end
    end
    result
  end
end

#iterative solution
def fibs(n)
  return [1] if n == 1
  fibs_array = [1, 1]
  until fibs_array.length == n
    fibs_array << fibs_array[-1] + fibs_array[-2]
  end
  fibs_array
end
fibs(5)

#recursive solution
def fibs(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  previous_array = fibs(n-1)
  fibs_array = previous_array
  fibs_array << previous_array[-1] + previous_array[-2]
  fibs_array
end

#recursive solution
def subsets(array)
  return [[]] if array.length < 1
  return [[], [array[0]]] if array.length == 1
  previous = subsets(array[0..-2])
  new_subsets = subsets(array[0..-2])
  new_subsets.each do |el|
    el << array[-1]
  end
  previous + new_subsets
end
subsets([1, 2, 3])

def permutations(array, n = array.length)
  result = []
  if n == 1
    array.each do |el|
      result << [el]
    end
    return result
  end
  prev = permutations(array, n - 1)
  prev.each do |el|
    poss_nums = array - el
    poss_nums.each do |el2|
      result << el + [el2]
    end
  end
  result
end

def binary_search(array, target)
  return array[0] == target if array.length == 1
  search = array[array.length/2] <=> target
  if search == 0
    return array.length/2
  elsif search == -1
    binary_search(array[0...length/2], target)
  else
     binary_search(array[(length/2 + 1)..-1], target)
  end
end


def merge_sort(array)
  return array if array.length == 1 || array.length == 0
  array1 = merge_sort(array[0...array.length/2])
  array2 = merge_sort(array[array.length/2..-1])
  merge(array1, array2)
end

def merge(array1, array2)
  results = []
  while array1.length != 0 && array2.length != 0
    if array1[0] < array2[0]
      results << array1.shift
    else
      results << array2.shift
    end
  end
  results += array1 if array1.length != 0
  results += array2 if array2.length != 0
  results
end

def greedy_make_change(target, array = [25, 10, 5, 1])
  return [] if target == 0
  possible_coin = array.select { |el| el <= target }
  largest_coin = possible_coin.max
  [largest_coin] + greedy_make_change(target - largest_coin, array)

end

def make_better_change(target, array = [25, 10, 5, 1])
  return nil if target < 0
  return [] if target == 0
  all_poss = []
  possible_coin = array.select { |el| el <= target }
  possible_coin.each do |coin|
    one_poss = []
    change = target - coin
    one_poss << [coin] + make_better_change(change, array)
    all_poss += one_poss
  end
  all_poss.sort_by { |one_poss| one_poss.length }.first.flatten
end
