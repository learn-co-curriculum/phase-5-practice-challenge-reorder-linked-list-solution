require_relative './node'

class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def reorder_linked_list
    return if head.nil?

    odd = head
    even = head.next_node
    even_head = even

    while even && even.next_node
      odd.next_node = even.next_node
      odd = odd.next_node

      even.next_node = odd.next_node
      even = even.next_node
    end

    odd.next_node = even_head
  end
end
