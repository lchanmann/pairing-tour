require_relative '../lib/merge_sort'

describe MergeSort do
  it "should sort an array with one item" do
    array = [ 3 ]
    result = merge_sort array

    expect(result).to eq [ 3 ]
  end

  it "should order array correctly" do
    array = [ 2, 5, 9, 8, 7 ]
    result = merge_sort array

    expect(result).to eq [ 2, 5, 7, 8, 9 ]
  end
end
