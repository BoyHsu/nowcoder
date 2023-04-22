//
//  main.swift
//  PermuteUnique
//
//  Created by 徐恩 on 2023/4/22.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param num int整型一维数组
     * @return int整型二维数组
     */
    var visited = [Bool]()
    var sequence = [Int]()
    var nums = [Int]()
    var res: Set<[Int]> = []
    func permuteUnique ( _ num: [Int]) -> [[Int]] {
        nums = num
        visited = Array(repeating: false, count: nums.count)
        dfs(0)
        return Array(res).sorted { a0, a1 in
            for i in a0.indices {
                if a0[i] > a1[i] {
                    return false
                } else if a0[i] < a1[i] {
                    return true
                }
            }
            return true
        }
    }
    
    func dfs(_ idx: Int) {
        if idx == nums.count {
            res.insert(sequence)
            return
        }
        
        for i in nums.indices {
            if visited[i] {
                continue
            }
            visited[i] = true
            sequence.append(nums[i])
            dfs(idx+1)
            sequence.removeLast()
            visited[i] = false
        }
    }
}

