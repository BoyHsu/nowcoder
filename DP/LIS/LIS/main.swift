//
//  main.swift
//  LIS
//
//  Created by 徐恩 on 2023/4/25.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * 给定数组的最长严格上升子序列的长度。
     * @param arr int整型一维数组 给定的数组
     * @return int整型
     */
    func LIS ( _ arr: [Int]) -> Int {
        guard !arr.isEmpty else { return 0 }
        var dp = Array(repeating: 1, count: arr.count)
        var res = 1
        for i in 1..<arr.count {
            let num = arr[i]
            var val = 1
            for j in 0..<i {
                if num > arr[j] {
                    val = max(val, dp[j]+1)
                }
            }
            dp[i] = val
            res = max(res, val)
        }
        return res
    }
}


let s = Solution()
assert(s.LIS([3,5,7,1,2,4,6,3,8,9,5,6]) == 6)
assert(s.LIS([6,3,1,5,2,3,7]) == 4)
print("done")

