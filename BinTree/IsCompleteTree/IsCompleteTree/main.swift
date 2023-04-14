//
//  main.swift
//  IsCompleteTree
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
     * @param root TreeNode类
     * @return bool布尔型
     */
    func isCompleteTree ( _ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        var queue = [root]
        var level = 1
        while !queue.isEmpty {
            var nextLevel = [TreeNode]()
            var full = true
            for node in queue {
                if let l = node.left {
                    if !full {
                        return false
                    } else {
                        nextLevel.append(l)
                    }
                } else {
                    full = false
                }
                
                if let r = node.right {
                    if !full {
                        return false
                    } else {
                        nextLevel.append(r)
                    }
                } else {
                    full = false
                }
            }
            if !nextLevel.isEmpty, queue.count != 1 << (level - 1) {
                return false
            }
            queue = nextLevel
            level += 1
        }
        return true
    }
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
//assert(s.isCompleteTree(rootNode([1])) == true)
//assert(s.isCompleteTree(rootNode([1,2,3,5,nil,7,8])) == false)
assert(s.isCompleteTree(rootNode([1,2,3,4,5,6])) == true)
assert(s.isCompleteTree(rootNode([1,383,nil,886,nil,777,nil,915,nil,793,nil,335,nil,386,nil,492,nil,649,nil,421,nil,362,nil,27,nil,690,nil,59,nil,763,nil,926,nil,540,nil,426,nil,172,nil,736,nil,211,nil,368,nil,567,nil,429,nil,782,nil,530,nil,862,nil,123,nil,67,nil,135,nil,929,nil,802,nil,22,nil,58,nil,69,nil,167,nil,393,nil,456,nil,11,nil,42,nil,229,nil,373,nil,421,nil,919,nil,784,nil,537,nil,198,nil,324,nil,315,nil,370,nil,413,nil,526,nil,91,nil,980,nil,956,nil,873,nil,862,nil,170,nil,996,nil,281,nil,305,nil,925,nil,84,nil,327,nil,336,nil,505,nil,846,nil,729,nil,313,nil,857,nil,124,nil,895,nil,582,nil,545,nil,814,nil,367,nil,434,nil,364,nil,43,nil,750,nil,87,nil,808,nil,276,nil,178,nil,788,nil,584,nil,403,nil,651,nil,754,nil,399,nil,932,nil,60,nil,676,nil,368,nil,739,nil,12,nil,226,nil,586,nil,94])) == false)

print("done")
