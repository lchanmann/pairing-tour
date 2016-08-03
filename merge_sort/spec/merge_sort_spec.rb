require_relative '../lib/merge_sort'

describe MergeSort do
  it "should sort an array with one item" do
    array = [ 3 ]
    result = array.merge_sort

    expect(result).to eq [ 3 ]
  end
end
