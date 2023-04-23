//
//  main.swift
//  MinCostClimbingStairs
//
//  Created by 徐恩 on 2023/4/23.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param cost int整型一维数组
     * @return int整型
     */
    func minCostClimbingStairs ( _ cost: [Int]) -> Int {
        if cost.count == 1 {
            return 0
        }
        var dp = Array(repeating: 0, count: cost.count)
        dp[0] = cost[0]
        dp[1] = cost[1]
        var lastCost = dp[0]
        for i in 2..<cost.count {
            dp[i] = min(dp[i-1], lastCost)+cost[i]
            lastCost = dp[i-1]
        }
        return min(dp[cost.count-1], dp[cost.count-2])
    }
}

let s = Solution()
assert(s.minCostClimbingStairs([2,5,20]) == 5)
assert(s.minCostClimbingStairs([1,100,1,1,1,90,1,1,80,1]) == 6)
print("done")

