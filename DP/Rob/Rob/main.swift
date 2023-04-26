//
//  main.swift
//  Rob
//
//  Created by 徐恩 on 2023/4/26.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param nums int整型一维数组
     * @return int整型
     */
    func rob ( _ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        } else if nums.count == 2 {
            return max(nums[0], nums[1])
        } else if nums.count == 3 {
            return max(nums[0]+nums[2], nums[1])
        }
        var dp = nums
        dp[2] += dp[0]
        for i in 3..<nums.count {
            dp[i] += max(dp[i-2], dp[i-3])
        }
        return max(dp.last!, dp[dp.count-2])
    }
}

let s = Solution()
assert(s.rob([1,2,3,4]) == 6)
assert(s.rob([1,3,6]) == 7)
assert(s.rob([2,10,5]) == 10)
assert(s.rob([2,10,5,3,5,2]) == 15)
print("done")

