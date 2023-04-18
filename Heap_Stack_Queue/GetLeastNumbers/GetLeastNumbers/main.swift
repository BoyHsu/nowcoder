//
//  main.swift
//  GetLeastNumbers
//
//  Created by 徐恩 on 2023/4/18.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param input int整型一维数组
     * @param k int整型
     * @return int整型一维数组
     */
    func GetLeastNumbers_Solution ( _ input: [Int],  _ k: Int) -> [Int] {
        var res = [Int]()
        for num in input {
            var lo = 0, hi = res.count
            while lo < hi {
                let mi = (lo + hi) >> 1
                if res[mi] > num {
                    hi = mi
                } else {
                    lo = mi + 1
                }
            }
            if lo < k {
                res.insert(num, at: lo)
                if res.count > k {
                    res.removeLast()
                }
            }
        }
        return res
        
        // return Array(input.sorted()[0..<k])
    }
}

let s = Solution()
assert(s.GetLeastNumbers_Solution([4,5,1,6,2,7,3,8], 4) == [1,2,3,4])
assert(s.GetLeastNumbers_Solution([1],0) == [])
assert(s.GetLeastNumbers_Solution([0,1,2,1,2], 3) == [0, 1, 1])
print("done")

