//
//  main.swift
//  ZPrint
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
     * @return int整型二维数组
     */
    func Print ( _ pRoot: TreeNode?) -> [[Int]] {
        guard let root = pRoot else { return [] }
        var queue = [root]
        var res = [[Int]]()
        var needReverse = false
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
            if needReverse {
                res.append(vals.reversed())
            } else {
                res.append(vals)
            }
            needReverse.toggle()
            queue = nextLevel
        }
        return res
    }
}
