//
//  main.swift
//  Convert
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
     * @param pRootOfTree TreeNode类
     * @return TreeNode类
     */
    func Convert ( _ pRootOfTree: TreeNode?) -> TreeNode? {
        var head: TreeNode? = nil
        var listNode: TreeNode? = nil
        var treeNode = pRootOfTree
        var stack = [TreeNode]()
        while true {
            while treeNode != nil {
                stack.append(treeNode!)
                treeNode = treeNode?.left
            }
            if stack.isEmpty {
                break
            }
            
            let node = stack.popLast()
            listNode?.right = node
            node?.left = listNode
            listNode = node
            if head == nil {
                head = node
            }
            treeNode = node?.right
        }
        return head
    }
}

