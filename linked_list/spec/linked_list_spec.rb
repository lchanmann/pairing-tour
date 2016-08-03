require_relative '../lib/linked_list'

shared_context "append 10 items", shared_context: :metadata do
  let!(:array) { [1,2,3] }

  before do
    array.each { |x| subject.append x }
  end
end

describe LinkedList do
  it { should be_empty }

  describe "#append" do
    1.upto(5) do |n|
      it "#{n} item(s)" do
        1.upto(n) do |x|
          subject.append x
          expect(subject.tail.data).to eq x
        end

        expect(subject.size).to eq n
      end
    end
  end

  describe "#each" do
    include_context "append 10 items"

    it "should return item in order" do
      items = subject.each_item

      array.each do |x|
        expect(items.next.data).to eq x
      end
    end
  end

  describe "#at" do
    include_context "append 10 items"
    
    it "should get item by index" do
      array.each_with_index do |x, index|
        expect(subject.at(index).data).to eq x
      end
    end
  end
end
