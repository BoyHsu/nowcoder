//
//  main.swift
//  IsValidBST
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
     * @return bool布尔型
     */
    func isValidBST ( _ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        return _isValidBST(root).0
    }
    
    func _isValidBST(_ node: TreeNode) -> (Bool, Int, Int) {
        var res = (true, node.val, node.val)
        if node.left == nil, node.right == nil {
            return res
        }
        
        if let l = node.left {
            let (isValidBST, min, max) = _isValidBST(l)
            if isValidBST {
                res.0 = max <= node.val
                res.1 = min
            } else {
                res.0 = false
            }
        }
        
        if let r = node.right {
            let (isValidBST, min, max) = _isValidBST(r)
            if isValidBST {
                res.0 = res.0 && (min >= node.val)
                res.2 = max
            } else {
                res.0 = false
            }
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
assert(s.isValidBST(rootNode([1,2,3])) == false)
print("done")
