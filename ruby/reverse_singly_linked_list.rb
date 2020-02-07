# Given the pointer/reference to the head of a singly linked list,
# reverse it and return the pointer/reference to the head of reversed linked list.

def reverse_singly_linked_list_rec(forward_head)
  return forward_head if !forward_head || !forward_head.next

  reversed_head = reverse_singly_linked_list_rec(forward_head.next)

  forward_head.next.next = forward_head
  forward_head.next = nil
  reversed_head
end

def reverse_singly_linked_list(forward_head)
  reversed_head = forward_head
  to_do = forward_head.next
  reversed_head.next = nil

  while(to_do)
    temp = to_do
    to_do = to_do.next
    temp.next = reversed_head
    reversed_head = temp
  end

  reversed_head
end

def print_linked_list(node)
  while(node)
    puts node.value
    node = node.next
  end
end

def build_random_list(size = 10)
  head = Node.new(value: rand(100))
  tmp_node = head
  (0...size).each do |i|
    next_node = Node.new(value: rand(100))
    tmp_node.next = next_node
    tmp_node = next_node
  end
  head
end

class Node

  attr_accessor :value, :next
  def initialize(value:)
    @value = value
    @next = nil
  end

end

forward = build_random_list
puts "===Forward==="
print_linked_list(forward)

reversed = reverse_singly_linked_list(forward)

puts "===Reversed==="
print_linked_list(reversed)

puts "===Recursed==="

forward = build_random_list
puts "===Forward==="
print_linked_list(forward)

reversed = reverse_singly_linked_list_rec(forward)

puts "===Reversed==="
print_linked_list(reversed)
