//
//  main.swift
//  MaxDepth
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
     * @return int整型
     */
    func maxDepth ( _ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        if root.left == nil && root.right == nil {
            return 1
        }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
}

