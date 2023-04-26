//
//  main.swift
//  Rob_II
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
        if nums.count <= 3 {
            return nums.max()!
        }
        let res1 = _rob(nums, 0, nums.count-2)
        let res2 = _rob(nums, 1, nums.count-1)
        return max(res1, res2)
    }
    
    func _rob(_ nums: [Int], _ from: Int, _ to: Int) -> Int {
        if to - from == 1 {
            return max(nums[from], nums[to])
        }
        
        var dp = nums
        for i in from+2...to {
            dp[i] = max(dp[i-2]+dp[i], dp[i-1])
        }
        
        return dp[to]
    }
    
}

let s = Solution()
assert(s.rob([43,4,4,1,26,29,24,44,52,12]) == 149)
assert(s.rob([19,43,94,4,34,33,91,75,38,79]) == 298)
assert(s.rob([25,85,17,19,10,6,3,32,93,64]) == 206)
assert(s.rob([1,2,3,4]) == 6)
assert(s.rob([1,2,3,4,5]) == 8)
print("done")

