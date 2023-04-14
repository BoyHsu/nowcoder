//
//  main.swift
//  Mirror
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
     * @param pRoot TreeNode类
     * @return TreeNode类
     */
    func Mirror ( _ pRoot: TreeNode?) -> TreeNode? {
        guard let pRoot = pRoot else { return nil }
        let left = Mirror(pRoot.left)
        let right = Mirror(pRoot.right)
        pRoot.left = right
        pRoot.right = left
        return pRoot
    }
}

