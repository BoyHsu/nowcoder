//
//  main.swift
//  PostorderTraversal
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
     *
     * @param root TreeNode类
     * @return int整型一维数组
     */
    func postorderTraversal ( _ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var stack = [root]
        var node: TreeNode? = root
        var res = [Int]()
        while !stack.isEmpty {
            let top = stack.last!
            if top.left !== node && top.right !== node {
                node = top
                while node?.left != nil || node?.right != nil {
                    if let r = node?.right {
                        stack.append(r)
                    }
                    if let l = node?.left {
                        stack.append(l)
                    }
                    node = stack.last
                }
            }
            
            node = stack.popLast()
            res.append(node!.val)
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
//assert(s.postorderTraversal(rootNode([4,2,6,1,3,5,7])) == [1,3,2,5,7,6,4])
assert(s.postorderTraversal(rootNode([1,nil,2,3])) == [3,2,1])
print("done")
