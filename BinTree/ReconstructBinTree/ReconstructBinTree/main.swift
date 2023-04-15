//
//  main.swift
//  ReconstructBinTree
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
     * @param pre int整型一维数组
     * @param vin int整型一维数组
     * @return TreeNode类
     */
    func reConstructBinaryTree ( _ pre: [Int],  _ vin: [Int]) -> TreeNode? {
        return _reConstructBinaryTree(pre, 0, pre.count, vin, 0, vin.count)
    }
    
    func _reConstructBinaryTree(_ pre: [Int], _ loP: Int, _ hiP: Int, _ vin: [Int], _ loV: Int, _ hiV: Int) -> TreeNode? {
        if loV + 1 == hiV {
            return TreeNode(vin[loV])
        } else if loV == hiV {
            return nil
        }
        
        let mid = pre[loP]
        let root = TreeNode(mid)
        
        let idx = vin.firstIndex(where: { $0 == mid })!
        let count = idx - loV
        
        root.left = _reConstructBinaryTree(pre, loP+1, loP+1+count, vin, loV, idx)
        root.right = _reConstructBinaryTree(pre, loP+1+count, hiP, vin, idx+1, hiV)
        return root
    }
}

extension TreeNode {
    convenience init?(_ str: String) {
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
        
        if let root = nodes.first! {
            self.init(root.val, root.left, root.right)
        } else {
            return nil
        }
    }
}

extension TreeNode? {
    func serialize() -> String {
        guard let root = self else { return "" }
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
        while res.last?.isWholeNumber != true {
            res.removeLast()
        }
        res.append("}")
        return res
    }
}

let s = Solution()
assert(s.reConstructBinaryTree([1,2,4,7,3,5,6,8],[4,7,2,1,5,3,8,6]).serialize() == "{1,2,3,4,#,5,6,#,7,#,#,8}")
print("done")
