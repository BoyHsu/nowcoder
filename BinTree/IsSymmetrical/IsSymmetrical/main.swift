//
//  main.swift
//  IsSymmetrical
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
     * @param pRoot TreeNode类
     * @return bool布尔型
     */
    func isSymmetrical(_ pRoot: TreeNode?) -> Bool {
        return _isSymmetrical(pRoot?.left, pRoot?.right)
    }
    
    func _isSymmetrical(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        if node1 == nil, node2 == nil {
            return true
        } else if node1 == nil {
            return false
        } else if node2 == nil {
            return false
        }
        
        if node1!.val != node2!.val {
            return false
        }
        
        return _isSymmetrical(node1?.left, node2?.right) && _isSymmetrical(node1?.right, node2?.left)
    }
}

