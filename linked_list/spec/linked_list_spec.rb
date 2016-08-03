require_relative '../lib/linked_list'

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
    let!(:array) { [1,2,3] }

    before do
      array.each { |x| subject.append x }
    end

    it "should return item in order" do
      items = subject.each_item

      array.each do |x|
        expect(items.next.data).to eq x
      end
    end
  end
end
