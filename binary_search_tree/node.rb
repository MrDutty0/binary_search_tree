# frozen_string_literal: true

# Class for binary search tree's elements
class Node
  attr_accessor :data, :left, :right

  def initialize(data = 0, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end
