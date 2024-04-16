# frozen_string_literal: true

require_relative 'binary_search_tree/tree'

input_array = Array.new(15) { rand(1..100) }

bst = Tree.new(input_array)

puts bst.balanced?

p bst.preorder
p bst.inorder
p bst.postorder

puts bst.balanced?

# unbalancing the tree
while bst.balanced?
  rand_num = rand(1..100)
  next if input_array.include?(rand_num)

  bst.insert(rand_num)
end

puts bst.balanced?
# Indeed the tree has been unbalanced

bst.rebalance
# Now the tree is balanced again
puts bst.balanced?

p bst.preorder
p bst.inorder
p bst.postorder
