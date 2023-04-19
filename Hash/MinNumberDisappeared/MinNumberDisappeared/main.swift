//
//  main.swift
//  MinNumberDisappeared
//
//  Created by 徐恩 on 2023/4/19.
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
    func minNumberDisappeared ( _ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var last = 0, res = 1
        
        var index = -1
        
        for (i, num) in nums.enumerated() {
            if num > 0 {
                index = i
                break
            }
        }
        if index != -1 {
            for i in index ..< nums.count {
                let num = nums[i]
                if num != last {
                    if num != res {
                        break
                    } else {
                        res += 1
                    }
                    last = num
                }
            }
        }
        return res
    }
}

let s = Solution()
assert(s.minNumberDisappeared([3,2,1]) == 4)
print("done")

