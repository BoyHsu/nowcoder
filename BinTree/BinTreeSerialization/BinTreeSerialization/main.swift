//
//  main.swift
//  BinTreeSerialization
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
     * @return TreeNode类
     */
    func Serialize ( _ root: TreeNode?) -> String {
        guard let root = root else { return "" }
        var queue = [root]
        var res = "{"
        var curLevel = "\(root.val)"
        while !queue.isEmpty {
            res.append(contentsOf: curLevel)
            curLevel.removeAll(keepingCapacity: true)
            var nextLevel = [TreeNode]()
            for node in queue {
                if let l = node.left {
                    nextLevel.append(l)
                    curLevel.append(",\(l.val)")
                } else {
                    curLevel.append(",#")
                }
                if let r = node.right {
                    nextLevel.append(r)
                    curLevel.append(",\(r.val)")
                } else {
                    curLevel.append(",#")
                }
            }
            queue = nextLevel
        }
        res.append("}")
        return res
    }
    
    func Deserialize ( _ str: String) -> TreeNode? {
        guard !str.isEmpty else { return nil }
        var str = str
        str.remove(at: str.startIndex)
        str.remove(at: str.index(before: str.endIndex))
        var nodes = [TreeNode?]()
        
        for subStr in str.split(separator: ",") {
            if let val = Int(subStr) {
                nodes.append(TreeNode(val))
            } else if subStr == "#" {
                nodes.append(nil)
            }
        }
        
        var idxParent = 0, idxChild = 1
        let count = nodes.count
        while idxChild < count {
            if let node = nodes[idxParent] {
                node.left = nodes[idxChild]
                idxChild += 1
                if idxChild < count {
                    node.right = nodes[idxChild]
                    idxChild += 1
                }
            }
            idxParent += 1
        }
        
        return nodes.first ?? nil
    }
}

let s = Solution()

var str = "{1,2,3,#,#,6,7}"
assert(s.Serialize(s.Deserialize(str)) == str)

str = "{100,22,33,#,#,66,7}"
assert(s.Serialize(s.Deserialize(str)) == str)

print("done")
