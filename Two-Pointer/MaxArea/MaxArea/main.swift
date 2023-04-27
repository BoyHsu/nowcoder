//
//  main.swift
//  MaxArea
//
//  Created by 徐恩 on 2023/4/28.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param height int整型一维数组
     * @return int整型
     */
    func maxArea ( _ height: [Int]) -> Int {
        guard height.count > 1 else { return 0 }
        var l = 0, r = height.count-1
        var res = 0
        while l < r {
            let area = min(height[l], height[r]) * (r-l)
            res = max(res, area)
            if height[l] < height[r] {
                l += 1
            } else {
                r -= 1
            }
        }
        return res
    }
}

let s = Solution()
assert(s.maxArea([1,7,3,2,4,5,8,2,7]) == 49)
assert(s.maxArea([2,2]) == 2)
assert(s.maxArea([5,4,3,2,1,5]) == 25)
print("done")

