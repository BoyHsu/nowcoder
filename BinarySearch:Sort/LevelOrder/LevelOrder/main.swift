//
//  main.swift
//  LevelOrder
//
//  Created by 徐恩 on 2023/4/14.
//

import Foundation



public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int=0, _ left: TreeNode?=nil, _ right: TreeNode?=nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param root TreeNode类
     * @return int整型二维数组
     */
    func levelOrder ( _ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var queue = [root]
        var res = [[Int]]()
        while !queue.isEmpty {
            var nextLevel = [TreeNode]()
            var vals = [Int]()
            for node in queue {
                vals.append(node.val)
                if let l = node.left {
                    nextLevel.append(l)
                }
                if let r = node.right {
                    nextLevel.append(r)
                }
            }
            res.append(vals)
            queue = nextLevel
        }
        return res
    }
}

func rootNode(_ nums: [Int?]) -> TreeNode? {
    if nums.isEmpty {
        return nil
    } else if nums[0] == nil {
        return nil
    }
    
    var nodes = [TreeNode?](repeating: nil, count: nums.count)
    
    for i in nums.indices {
        if let num = nums[i] {
            nodes[i] = TreeNode(num)
        }
    }
    
    var idxP = 0, idxC = 1
    while idxC < nums.count {
        if let node = nodes[idxP] {
            node.left = nodes[idxC]
            idxC += 1
            if idxC >= nums.count {
                break
            }
            node.right = nodes[idxC]
            idxC += 1
        }
        
        idxP += 1
    }
    return nodes[0]
}

let s = Solution()
assert(s.levelOrder(rootNode([1,2])) == [[1],[2]])
assert(s.levelOrder(rootNode([1,2,3,4,nil,nil,5])) == [[1],[2,3],[4,5]])
print("done")
