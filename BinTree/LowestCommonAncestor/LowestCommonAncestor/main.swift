//
//  main.swift
//  LowestCommonAncestor
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
     *
     * @param root TreeNode类
     * @param p int整型
     * @param q int整型
     * @return int整型
     */
    func lowestCommonAncestor(_ root: TreeNode?, _ p: Int, _ q: Int) -> Int {
        guard let root = root else {
            return -1
        }
        
        if root.val > p, root.val > q {
            return lowestCommonAncestor(root.left, p, q)
        } else if root.val < p, root.val < q {
            return lowestCommonAncestor(root.right, p, q)
        } else {
            return root.val
        }
    }
//    func lowestCommonAncestor(_ root: TreeNode?, _ p: Int, _ q: Int) -> Int {
//        var queue = [root!]
//        var paths = [[root!.val]]
//        var pPath: [Int]? = root?.val == p ? [root!.val] : nil
//        var qPath: [Int]? = root?.val == q ? [root!.val] : nil
//
//        while !queue.isEmpty {
//            var nextLevel = [TreeNode]()
//            var nextLevelPaths = [[Int]]()
//
//            func add(_ treeNode: TreeNode?, _ path: [Int]) {
//                if let n = treeNode {
//                    nextLevel.append(n)
//                    var path = path
//                    path.append(n.val)
//
//                    if n.val == p {
//                        pPath = path
//                    } else if n.val == q {
//                        qPath = path
//                    }
//
//                    nextLevelPaths.append(path)
//                }
//            }
//
//            for i in queue.indices {
//                let node = queue[i]
//                let path = paths[i]
//
//                add(node.left, path)
//                add(node.right, path)
//            }
//
//            if pPath != nil && qPath != nil {
//                break
//            }
//
//            queue = nextLevel
//            paths = nextLevelPaths
//        }
//
//        var last: Int? = nil
//        if let pPath = pPath, let qPath = qPath {
//            for i in 0..<min(pPath.count, qPath.count) {
//                if pPath[i] != qPath[i] {
//                    break
//                }
//                last = pPath[i]
//            }
//        }
//        return last ?? 0
//    }
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
//{3,1,4,#,2},2,3
//assert(s.lowestCommonAncestor(rootNode([3,1,4,nil,2]), 2, 3) == 3)
//{7,1,12,0,4,11,14,#,#,3,5},12,11
assert(s.lowestCommonAncestor(rootNode([7,1,12,0,4,11,14,nil,nil,3,5]), 12, 11) == 12)
print("done")
