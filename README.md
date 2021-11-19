# Phase 5 Reorder Linked List Practice Challenge: Solution

To complete this challenge, you need to traverse through each adjacent odd/even
**pair** of nodes, pair by pair. In each step, you adjust the current odd node's
`next_node` property to point to the next odd node in the list, and the current
even node's `next_node` property to the next even node in the list. This
effectively creates two separate lists: one containing the odd nodes and the
other containing the even nodes. FInally, when the end of the list is reached,
the `next_node` property of the last odd node is then set to the first even
node, which combines the two lists with the odd nodes first.

## Solution

```rb
  def reorder_linked_list
    if !!head
      # set odd to the first odd node and even to the first even node
      odd = head
      even = head.next_node
      # keep a reference to the first even node
      even_head = even
      
      while even && even.next_node
        # change odd's next_node property to point to the next odd node
        odd.next_node = even.next_node
        # reset the odd variable to that node
        odd = odd.next_node
        # change even's next_node property to point to the node after
        # the new odd node, i.e., the next even node
        even.next_node = odd.next_node
        # reset the even variable to that node
        even = even.next_node
      end

      # change the next_node property of the last odd node to point to the first even node
      odd.next_node = even_head
    end
    head
  end
```

We start by setting our `odd` pointer variable to the `head` and `even` to the
first even node, `odd.next_node`. We also save a reference to the first even
node in `even_head`:

![reorder-step-1](https://curriculum-content.s3.amazonaws.com/phase-5/practice-challenge-reorder-linked-list-solution/reorder-step-1.png)

Because `even` and `even.next` both exist we enter the loop.

First, we change `odd.next` to point to the next odd node, `even.next`. We also
move our `odd` pointer to point to that node:

![reorder-step-2](https://curriculum-content.s3.amazonaws.com/phase-5/practice-challenge-reorder-linked-list-solution/reorder-step-2.png)

We then repeat the process for the even node:

![reorder-step-3](https://curriculum-content.s3.amazonaws.com/phase-5/practice-challenge-reorder-linked-list-solution/reorder-step-3.png)

`even` and `even.next` still both exist so our loop continues.

Next, we again change `odd.next` to point to the next odd node and point `odd`
to that node:

![reorder-step-4](https://curriculum-content.s3.amazonaws.com/phase-5/practice-challenge-reorder-linked-list-solution/reorder-step-4.png)

When we repeat the process for `even`, there is no `odd.next` so `even.next` and
`even` are set to nil, ending the loop:

![reorder-step-5](https://curriculum-content.s3.amazonaws.com/phase-5/practice-challenge-reorder-linked-list-solution/reorder-step-5.png)

Finally, we set `odd.next` to `even_head`:

![reorder-step-6](https://curriculum-content.s3.amazonaws.com/phase-5/practice-challenge-reorder-linked-list-solution/reorder-step-6.png)

In the end, our linked_list looks like this:

![final-order](https://curriculum-content.s3.amazonaws.com/phase-5/practice-challenge-reorder-linked-list-solution/final-order.png)

### Complexity

```text
Time: O(n)
Space: O(1)
```

Time: we traverse the linked list once, giving a time complexity of O(n).

Space: The extra variables we are using here are our two pointers, `odd` and
`even`, and the `head_even` variable, which stores the value of the first even
node. None of these variables grow with the size of the input so the space
complexity is O(1).

## The Two-Pointer Approach

This solution uses what's known as a two-pointer approach. We use two separate
pointers: `odd` points to the current odd node and `even` points to the current
even node. We traverse through the linked list by moving each pointer two steps
at a time.

### Other Uses

A two-pointer approach can be used to reverse a string or an array:

```rb
def reverse_the_string(str)
  i = 0
  j = str.length - 1
  while i < str.length/2
    temp = str[i]
    str[i] = str[j]
    str[j] = temp
    i += 1
    j -= 1
  end
  str
end

reverse_the_string("abcde")
# => "edcba"
```

Ruby allows a shortcut for swapping characters or array elements that avoids
creating a temporary variable and shortens the swap to a single line:

```rb
def reverse_the_string(str)
  i = 0
  j = str.length - 1
  while i < str.length/2
    str[i], str[j] = str[j], str[i]
    i += 1
    j -= 1
  end
  str
end
```

A two-pointer approach can also be used to find the midpoint of a string or
array. This approach uses what is generally referred to as a "slow" pointer and
a "fast" pointer:

```rb
def find_midpoint(arr)
  slow = 0
  fast = 0
  while fast < arr.length - 1
    slow += 1
    fast += 2
  end
  arr[slow]
end

find_midpoint([1, 2, 3, 4, 5])
# => 3
```

When the "fast" pointer reaches the end of the array or string, the "slow"
pointer is at the halfway point.

If the input array contains an even number of elements, the method returns the
first element in the second half of the array:

```rb
find_midpoint([1, 2, 3, 4, 5, 6])
# => 4
```

> Note: this same technique can be used to find the middle node in a linked list.

There are many other problems for which the two-pointer technique can be used.
As you gain experience working on algorithms, you will get better at recognizing
when the two-pointer technique might be helpful.
