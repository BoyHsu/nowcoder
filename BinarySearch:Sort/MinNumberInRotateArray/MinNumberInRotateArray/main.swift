//
//  main.swift
//  MinNumberInRotateArray
//
//  Created by 徐恩 on 2023/4/14.
//

import Foundation



public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param rotateArray int整型一维数组
     * @return int整型
     */
    func minNumberInRotateArray ( _ rotateArray: [Int]) -> Int {
        var lo = 0, hi = rotateArray.count - 1
        while lo < hi {
            let mi = (lo+hi)/2
            if rotateArray[mi] > rotateArray[hi] {
                lo = mi + 1
            } else if rotateArray[mi] == rotateArray[hi] {
                hi -= 1
            } else {
                hi = mi
            }
        }
        return rotateArray[lo]
    }
    
}

let s = Solution()
assert(s.minNumberInRotateArray([3,4,5,1,2]) == 1)
assert(s.minNumberInRotateArray([5,1,2,3,4]) == 1)
assert(s.minNumberInRotateArray([2,3,4,5,1]) == 1)
assert(s.minNumberInRotateArray([3,100,200,3]) == 3)
assert(s.minNumberInRotateArray([3,3,3,3]) == 3)
assert(s.minNumberInRotateArray([3,3,3,1,3]) == 1)
assert(s.minNumberInRotateArray([3,1,3,3,3]) == 1)
print("done")
