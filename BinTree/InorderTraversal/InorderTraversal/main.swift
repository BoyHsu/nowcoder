//
//  main.swift
//  InorderTraversal
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
    func inorderTraversal ( _ root: TreeNode?) -> [Int] {
        var stack = [TreeNode]()
        var node = root
        var res = [Int]()
        while true {
            while node != nil {
                stack.append(node!)
                node = node?.left
            }
            if stack.isEmpty {
                break
            }
            
            node = stack.popLast()
            res.append(node!.val)
            node = node?.right
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
        nodes[idxP]?.left = nodes[idxC]
        idxC += 1
        nodes[idxP]?.right = nodes[idxC]
        idxC += 1
        idxP += 1
    }
    return nodes[0]
}

let root = rootNode([4,2,6,1,3,5,7])
let s = Solution()
assert(s.inorderTraversal(root) == [1,2,3,4,5,6,7])
print("done")
