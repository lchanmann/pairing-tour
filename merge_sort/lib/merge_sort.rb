module MergeSort
  def merge_sort array
    return array if array.length == 1

    # divide
    mid   = array.length / 2
    left  = merge_sort array[0...mid]
    right = merge_sort array[mid...array.length]

    # conquer
    merge left, right
  end

  private
    def merge left, right
      result = []
      while !left.empty? && !right.empty?
        result << if left[0] <= right[0]
                    left.shift
                  else
                    right.shift
                  end
      end
      result + left + right
    end
end

include MergeSort
