//
//  main.swift
//  IsBalanced_Solution
//
//  Created by 徐恩 on 2023/4/15.
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
     * @param pRoot TreeNode类
     * @return bool布尔型
     */
    func IsBalanced_Solution(_ pRoot: TreeNode?) -> Bool {
        return _IsBalanced_Solution(pRoot).0
    }
    
    func _IsBalanced_Solution(_ node: TreeNode?) -> (Bool, Int) {
        guard let node = node else { return (true, 0) }
        let (isBal1, height1) = _IsBalanced_Solution(node.left)
        let (isBal2, height2) = _IsBalanced_Solution(node.right)
        return (isBal1 && isBal2 && abs(height1-height2) <= 1, max(height1, height2) + 1)
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
//assert(s.IsBalanced_Solution(rootNode([1,2,nil,3,nil,4,nil,5])) == false)
assert(s.IsBalanced_Solution(rootNode([1,2,3,4,nil,nil,5,6])) == false)
//
print("done")
