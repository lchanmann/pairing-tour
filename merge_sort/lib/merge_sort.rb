module MergeSort
  def self.included base
    # alias #array for base#self
    base.send(:define_method, :array) { self }
    
    # mix-in Divide to base
    base.include Divide
  end

  # MergeSort::Divide
  module Divide
    def merge_sort
      return array if array.length == 1

      # divide
      mid   = array.length / 2
      left  = array[0...mid].merge_sort
      right = array[mid...array.length].merge_sort

      # conquer
      Conquer.merge left, right
    end
  end

  # MergeSort::Conquer
  module Conquer
    def self.merge left, right
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
end

class Array
  include MergeSort
end
