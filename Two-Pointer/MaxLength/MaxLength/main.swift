//
//  main.swift
//  MaxLength
//
//  Created by 徐恩 on 2023/4/27.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param arr int整型一维数组 the array
     * @return int整型
     */
    func maxLength ( _ arr: [Int]) -> Int {
        var map = [Int: Int]()
        var maxLen = 0
        var prev = 0
        for (i, num) in arr.enumerated() {
            if let index = map[num] {
                maxLen = max(maxLen, map.keys.count)
                for j in prev...index {
                    map.removeValue(forKey: arr[j])
                }
                prev = index + 1
            }
            map[num] = i
        }
        return max(maxLen, map.keys.count)
    }
}

let s = Solution()
assert(s.maxLength([1,2,3,4,1,5,6,7,8,1]) == 8)
assert(s.maxLength([2,3,4,5]) == 4)
assert(s.maxLength([2,2,3,4,3]) == 3)
assert(s.maxLength([8,2,3,1,4,5,2,2]) == 6)
assert(s.maxLength([2,2,3,4,8,99,3]) == 5)
print("done")

