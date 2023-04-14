//
//  main.swift
//  MergeTrees
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
     * @param t1 TreeNode类
     * @param t2 TreeNode类
     * @return TreeNode类
     */
    func mergeTrees ( _ t1: TreeNode?,  _ t2: TreeNode?) -> TreeNode? {
        if t1 == nil || t2 == nil {
            return t1 ?? t2
        }
        
        t1!.val += t2!.val
        t1?.left = mergeTrees(t1?.left, t2?.left)
        t1?.right = mergeTrees(t1?.right, t2?.right)
        return t1
    }
}

