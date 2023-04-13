//
//  main.swift
//  BinarySearch
//
//  Created by 徐恩 on 2023/4/13.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param nums int整型一维数组
     * @param target int整型
     * @return int整型
     */
    func search ( _ nums: [Int],  _ target: Int) -> Int {
        var lo = 0, hi = nums.count
        while lo < hi {
            let mi  = (lo + hi)/2
            if nums[mi] > target {
                hi = mi
            } else {
                lo = mi + 1
            }
        }
        
        if lo == 0 {
            return -1
        } else {
            return nums[lo-1] == target ? lo-1 : -1
        }
    }
}

let s = Solution()
assert(s.search([-1,0,3,4,6,10,13,14],13) == 6)
assert(s.search([-1,0,3,4,6,10,13,14],2) == -1)
print("done")
