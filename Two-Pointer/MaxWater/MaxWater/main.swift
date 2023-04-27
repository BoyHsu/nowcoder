//
//  main.swift
//  MaxWater
//
//  Created by 徐恩 on 2023/4/28.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * max water
     * @param arr int整型一维数组 the array
     * @return long长整型
     */
    func maxWater ( _ arr: [Int]) -> Int64 {
        var stack = [Int]()
        var res: Int64 = 0
        for (i, height) in arr.enumerated() {
            while !stack.isEmpty, arr[stack.last!] < height {
                let j = stack.removeLast()
                if !stack.isEmpty {
                    let top = stack.last!
                    res += Int64((min(height, arr[top])-arr[j])*(i-top-1))
                }
            }
            stack.append(i)
        }
        return res
    }
}


let s = Solution()
assert(s.maxWater([3,1,2,5]) == 3)
assert(s.maxWater([3,2,1,5]) == 3)
assert(s.maxWater([5,2,1,3]) == 3)
assert(s.maxWater([5,3,2,1]) == 0)
assert(s.maxWater([4,5,1,3,2]) == 2)
print("done")

