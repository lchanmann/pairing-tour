class LinkedList
  attr_reader :size, :head, :tail

  def initialize
    @size = 0
  end

  def append data
    node  = Node.new data
    update_tail node
    @head = node if head.nil?

    @size += 1
  end

  def empty?
    size == 0
  end

  def each_item
    return to_enum __method__ unless block_given?

    node = head
    while node
      yield node
      node = node.next
    end
  end

  def at index
    return if index < 0 || index >= size

    node = head
    (1..index).each { node = node.next }
    node
  end

  private
    def update_tail node
      old_tail, @tail = tail, node
      old_tail.next = node if old_tail
    end
end

private
  class LinkedList::Node
    attr_accessor :data, :next

    def initialize data
      @data = data
    end
  end

