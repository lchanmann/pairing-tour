require_relative '../lib/linked_list'

shared_context "append 10 items", shared_context: :metadata do
  let!(:array) { (1..10).to_a }

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

  describe "#remove" do
    include_context "append 10 items"

    it "should delete the first item" do
      node = subject.remove 0

      expect(subject.size).to eq 9
      expect(subject.at(0)).to eq subject.head
    end

    it "should delete the last item" do
      node = subject.remove 9

      expect(subject.size).to eq 9
      expect(subject.at(8)).to eq subject.tail
    end

    it "should delete an item" do
      index = rand(1..8)
      node = subject.remove index
      expect(subject.size).to eq 9
      expect(subject.at(index).data).not_to eq node.data
    end

    it "should ignore non-existing item" do
      node = subject.remove 11
      expect(subject.size).to eq 10
    end
  end
end
