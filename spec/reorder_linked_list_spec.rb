RSpec.describe 'reorder_linked_list' do
  it 'Handles cases when the linked list is empty' do
    linked_list = LinkedList.new
    linked_list.reorder_linked_list
    expect(linked_list.head).to eq(nil)
  end

  it 'Handles cases when the linked list has one node' do
    linked_list = LinkedList.new(Node.new(1))
    linked_list.reorder_linked_list
    expect(linked_list.head.data).to eq(1)
  end

  it 'Handles cases when the linked list has two nodes' do
    # 1 -> 2
    head = Node.new(1, Node.new(2))
    linked_list = LinkedList.new(head)

    # 1 -> 2
    linked_list.reorder_linked_list

    node1 = linked_list.head
    expect(node1.data).to eq(1)

    node2 = node1.next_node
    expect(node2.data).to eq(2)
  end

  it 'Handles cases when the linked list has an even number of nodes' do
    # 1 -> 2 -> 3 -> 4
    head = Node.new(1, Node.new(2, Node.new(3, Node.new(4))))
    linked_list = LinkedList.new(head)

    # 1 -> 3 -> 2 -> 4
    linked_list.reorder_linked_list

    node1 = linked_list.head
    expect(node1.data).to eq(1)

    node2 = node1.next_node
    expect(node2.data).to eq(3)

    node3 = node2.next_node
    expect(node3.data).to eq(2)

    node4 = node3.next_node
    expect(node4.data).to eq(4)
  end

  it 'Handles cases when the linked list has an odd number of nodes' do
    # 2 -> 1 -> 3 -> 5 -> 6 -> 4 -> 7
    head =
      Node.new(
        2,
        Node.new(
          1,
          Node.new(3, Node.new(5, Node.new(6, Node.new(4, Node.new(7))))),
        ),
      )
    linked_list = LinkedList.new(head)

    # 2 -> 3 -> 6 -> 7 -> 1 -> 5 -> 4
    linked_list.reorder_linked_list

    node1 = linked_list.head
    expect(node1.data).to eq(2)

    node2 = node1.next_node
    expect(node2.data).to eq(3)

    node3 = node2.next_node
    expect(node3.data).to eq(6)

    node4 = node3.next_node
    expect(node4.data).to eq(7)

    node5 = node4.next_node
    expect(node5.data).to eq(1)

    node6 = node5.next_node
    expect(node6.data).to eq(5)

    node7 = node6.next_node
    expect(node7.data).to eq(4)
  end
end
