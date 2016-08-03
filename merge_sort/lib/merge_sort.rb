module MergeSort
  def self.included(base)
    # define #array method to return self
    base.send(:define_method, :array) { self }
  end

  def merge_sort
    array
  end
end

class Array
  include MergeSort
end
