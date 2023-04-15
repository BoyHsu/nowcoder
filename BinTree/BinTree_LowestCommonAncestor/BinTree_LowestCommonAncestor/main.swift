//
//  main.swift
//  BinTree_LowestCommonAncestor
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
     * @param root TreeNode类
     * @param o1 int整型
     * @param o2 int整型
     * @return int整型
     */
    var commonAncestor: TreeNode? = nil
    
    func lowestCommonAncestor ( _ root: TreeNode?,  _ o1: Int,  _ o2: Int) -> Int {
        _ = dfs(root, o1, o2)
        return commonAncestor?.val ?? 0
    }
    
    func dfs(_ node: TreeNode?, _ o1: Int, _ o2: Int) -> Bool {
        guard let node = node else { return false }
        
        let l = dfs(node.left, o1, o2)
        let r = dfs(node.right, o1, o2)
        
        if (l && r) || // 目标值分布在左右两侧
            ((node.val == o1 || node.val == o2) && (l||r)) { // 自身就是目标值，另一个目标值在子节点
            commonAncestor = node
        }
        return l || r || node.val == o1 || node.val == o2//返回本子树是否包含目标值
    }
}

