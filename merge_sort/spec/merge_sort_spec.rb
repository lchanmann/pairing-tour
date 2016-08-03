require_relative '../lib/merge_sort'

def an_array
  (0..9).to_a.shuffle
end

describe MergeSort do
  it "should sort an array with one item" do
    array = [ 3 ]
    result = array.merge_sort

    expect(result).to eq [ 3 ]
  end

  context "order array correctly" do
    5.times do |i|
      it "should order #{an_array}" do
        result = an_array.merge_sort
        expect(result).to eq (0..9).to_a
      end
    end
  end
end
