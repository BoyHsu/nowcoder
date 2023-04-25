//
//  main.swift
//  MinMoney
//
//  Created by 徐恩 on 2023/4/25.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 最少货币数
     * @param arr int整型一维数组 the array
     * @param aim int整型 the target
     * @return int整型
     */
    func minMoney(_ arr: [Int], _ aim: Int) -> Int {
        guard aim > 0 else { return 0 }
        var dp = [Int?](repeating: nil, count: aim + 1)
        dp[0] = 0
        
        for num in arr {
            if num > aim {
                continue
            }
            for i in num...aim {
                if let countPrev = dp[i-num] {
                    if let count = dp[i] {
                        dp[i] = min(count, countPrev+1)
                    } else {
                        dp[i] = countPrev + 1
                    }
                }
            }
        }
        
        return dp.last! ?? -1
    }
}


let s = Solution()
assert(s.minMoney([5,2,3],20) == 4)
assert(s.minMoney([5,2,3],0) == 0)
assert(s.minMoney([357,322,318,181,22,158,365],4976) == 14)
print("done")

