//
//  main.swift
//  InversePairs
//
//  Created by 徐恩 on 2023/4/14.
//

import Foundation



public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param data int整型一维数组
     * @return int整型
     */
    func InversePairs ( _ data: [Int]) -> Int {
        var sorted = [Int]()
        var res = 0
        for num in data {
            var lo = 0, hi = sorted.count
            while lo < hi {
                let mi = (lo + hi) / 2
                if sorted[mi] > num {
                    hi = mi
                } else {
                    lo = mi + 1
                }
            }
            res += sorted.count - lo
            sorted.insert(num, at: lo)
        }
        return res
    }
}

let s = Solution()
assert(s.InversePairs([1,2,3,4,5,6,7,0]) == 7)
assert(s.InversePairs([1,2,3]) == 0)
assert(s.InversePairs([1,2,3,2,3,1]) == 5)
print("done")
