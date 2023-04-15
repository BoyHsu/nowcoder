//
//  main.swift
//  RightViewOfBinTree
//
//  Created by 徐恩 on 2023/4/15.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 求二叉树的右视图
     * @param xianxu int整型一维数组 先序遍历
     * @param zhongxu int整型一维数组 中序遍历
     * @return int整型一维数组
     */
    func solve ( _ xianxu: [Int],  _ zhongxu: [Int]) -> [Int] {
        levelTraversal(xianxu, 0, xianxu.count, zhongxu, 0, zhongxu.count, 0)
        return vals.compactMap({ $0.last })
    }
    
    var vals = [[Int]]()
    
    func levelTraversal(_ pre:[Int], _ loP: Int, _ hiP: Int, _ vin: [Int], _ loI: Int, _ hiI: Int, _ level: Int) {
        if loP == hiP {
            return
        }
        
        let mid = pre[loP]
        if vals.count == level {
            vals.append([])
        }
        vals[level].append(mid)
        
        if loP + 1 == hiP {
            return
        }
        
        let idx = vin.firstIndex(where: { $0 == mid })!
        let count = idx - loI
        
        levelTraversal(pre, loP+1, loP+1+count, vin, loI, idx, level+1)
        levelTraversal(pre, loP+1+count, hiP, vin, idx+1, hiI, level+1)
    }
}

let s = Solution()
assert(s.solve([1,2,4,5,3],[4,2,5,1,3]) == [1,3,5])
print("done")

