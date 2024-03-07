module HW9
import StdEnv


:: Tree a = Node a (Tree a) (Tree a)
			|Leaf

treea = Node 2 (Node 5 (Node 3 (Node 24 Leaf Leaf) Leaf) (Node 6 Leaf (Node 7 Leaf Leaf))) (Node 8 (Node 15 Leaf (Node 10 Leaf (Node 14 Leaf Leaf))) (Node 13 Leaf (Node 16 Leaf Leaf)))
treeb = Node "abc" (Node "ghi" (Node "func" (Node "zyh" Leaf Leaf) Leaf) (Node "tional" Leaf (Node "haha" Leaf Leaf))) (Node "xyz" (Node "program" Leaf (Node "zyx" Leaf Leaf)) (Node "ming" Leaf (Node "cba" Leaf Leaf)))


/*
	Given a tree and an integer. Return the count of node in that level.
	The level where root exists is counted as level 1.
*/

nodeCountLevel :: (Tree a) Int -> Int
nodeCountLevel Leaf n = 0
nodeCountLevel (Node _ le ri) n
| n == 1 = 1 
= nodeCountLevel le (n-1) + nodeCountLevel ri (n-1)

//Start = nodeCountLevel treea 5 // 1
//Start = nodeCountLevel treeb 6  // 0
//Start = nodeCountLevel treea 3  // 4
//Start = nodeCountLevel treea 1  // 1
//Start = nodeCountLevel treeb 2  // 2

tree1 = (Node 4 (Node 10 (Node 6 Leaf Leaf)(Node 11 Leaf Leaf)) (Node 20 (Node 12 Leaf Leaf) Leaf))
tree2 = (Node 5 (Node 10 (Node 31 (Node 1 Leaf Leaf) Leaf) Leaf) (Node 17 (Node 31 (Node 14 (Node 12 Leaf Leaf) Leaf) Leaf) (Node 11 Leaf Leaf) ))
tree3 = (Node 12 (Node 11 (Node 11 (Node 32 Leaf Leaf) Leaf) Leaf) (Node 4 (Node 17 (Node 5 (Node 7 Leaf Leaf) Leaf) Leaf) (Node 3 Leaf (Node 4 Leaf Leaf)) ))
tree4 = (Node 7 (Node 11 tree1 tree2) (Node 5 tree3 tree2))
tree5 = Node 1 tree3 tree4

/* 2. Given the binary tree, find how many nodes are there such that they have exactly
3 grandchildren non-leaf nodes.
Ex.: 1
    / \
   2   3
  / \ / \
 4  5 6 Leaf

1st node has exactly 3 grandchildren, so it's a 'good' node.
*/
grandChildFinder :: (Tree Int) -> Int
grandChildFinder Leaf = 0
grandChildFinder (Node _ le ri)
| ((nodeCountLevel le 2) + (nodeCountLevel ri 2)) == 3 = 1 + grandChildFinder le + grandChildFinder ri
= grandChildFinder le + grandChildFinder ri

countTripleParents :: (Tree Int) -> Int
countTripleParents myTree = grandChildFinder myTree

//Start = countTripleParents tree1 // 1
//Start = countTripleParents tree2 // 1
//Start = countTripleParents tree3 // 1
//Start = countTripleParents tree4 // 4
//Start = countTripleParents tree5 // 5
