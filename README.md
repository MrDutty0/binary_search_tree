# Binary Search Trees Project

## Introduction

In this project from TOP (The Odin Project), I implemented a balanced binary search tree (BST) in Ruby. The project involved building classes for nodes and trees, as well as methods for inserting, deleting, finding nodes, traversing the tree, determining height and depth, checking balance, and rebalancing the tree.

## Assignment Overview

- **Node Class**: Implemented a Node class with attributes for data, left child, and right child. The class included functionality for comparing nodes using the Comparable module.

- **Tree Class**: Created a Tree class that accepts an array of data when initialized. The Tree class has a root attribute which is set using the build_tree method.

- **Build Tree Method**: Implemented a method to build a balanced binary tree from an array of data, ensuring uniqueness and proper ordering. 

- **Insert and Delete Methods**: Wrote methods to insert and delete nodes from the tree, considering various cases such as nodes with children or without children.

- **Find Method**: Implemented a method to find a node with a given value.

- **Traversal Methods**: Implemented methods for level order traversal, as well as inorder, preorder, and postorder depth-first traversals.

- **Height and Depth Methods**: Added methods to calculate the height and depth of a node in the tree.

- **Balanced? Method**: Implemented a method to check if the tree is balanced, ensuring that the height difference between left and right subtrees of every node is not more than 1.

- **Rebalance Method**: Implemented a method to rebalance an unbalanced tree, utilizing a traversal method to provide a new array for the build_tree method.

## Conclusion

This project provided hands-on experience in implementing a balanced binary search tree in Ruby, along with various operations and algorithms associated with trees. By completing this project, I gained a deeper understanding of data structures and algorithms, particularly in the context of binary trees and their applications.
