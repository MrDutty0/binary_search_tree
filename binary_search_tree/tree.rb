# frozen_string_literal: true

require_relative 'node'

# Binary search tree
class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(array)
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(value, node = root)
    return Node.new(value) if node.nil?

    if value == node.data
      return node
    elsif value < node.data
      node.left = insert(value, node.left)
    else
      node.right = insert(value, node.right)
    end

    node
  end

  def remove(value, node = root)
    return node if node.nil?

    if value < node.data
      node.left = remove(value, node.left)
    elsif value > node.data
      node.right = remove(value, node.right)
    else
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      succ_parent = node
      succ = node.right

      until succ.left.nil?
        succ_parent = succ
        succ = succ.left
      end

      if succ_parent == node
        succ_parent.right = succ.right
      else
        succ_parent.left = succ.right
      end

      node.data = succ.data
    end

    node
  end

  def find(value, node = root)
    return node if node.nil? || node.data == value

    value > node.data ? find(value, node.right) : find(value, node.left)
  end

  def level_order
    all_values = []

    q = Thread::Queue.new([@root])

    until q.empty?
      front = q.pop
      next if front.nil?

      block_given? ? yield(front) : all_values.push(front.data)

      q.push(front.left)
      q.push(front.right)
    end
    all_values.compact unless block_given?
  end

  ORDERS = %w[preorder inorder postorder].freeze
  ORDERS.each do |method|
    define_method method.to_s do |node = root, all_values = [], &block|
      return node if node.nil?

      traverse(node, all_values, &block) if method == 'preorder'
      send(method, node.left, all_values, &block)
      traverse(node, all_values, &block) if method == 'inorder'
      send(method, node.right, all_values, &block)
      traverse(node, all_values, &block) if method == 'postorder'

      all_values unless block
    end
  end

  def height(node = root)
    return 0 if node.nil?

    [height(node.left), height(node.right)].max + 1
  end

  def depth(node_to_find, node = root, dist = 0)
    return dist if node_to_find == node
    return 0 if node.nil? || node_to_find.nil?

    node_to_find.data > node.data ? depth(node_to_find, node.right, dist + 1) : depth(node_to_find, node.left, dist + 1)
  end

  def balanced?(node = root)
    return true if node.nil?
    return false unless (height(node.left) - height(node.right)).abs <= 1

    balanced?(node.left) && balanced?(node.right)
  end

  def rebalance
    @root = build_tree(level_order)
  end

  private

  def traverse(node, all_values, &block)
    block ? block.call(node) : all_values.push(node.data)
  end

  def build_tree(array)
    prepared_array = array.dup.uniq.sort

    create_BST(prepared_array)
  end

  def create_BST(arr)
    return if arr.empty?

    mid = arr.size / 2

    new_root = Node.new(arr[mid])

    new_root.left = create_BST(arr[0...mid])
    new_root.right = create_BST(arr[mid + 1..])

    new_root
  end
end
