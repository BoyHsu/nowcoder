//
//  main.swift
//  Candy
//
//  Created by 徐恩 on 2023/4/28.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * pick candy
     * @param arr int整型一维数组 the array
     * @return int整型
     */
//    func candy ( _ arr: [Int]) -> Int {
//        let n = arr.count
//                if (n<=1) {
//                    return n
//                }
//                var nums = [Int](repeating:1, count:n)
//                for i in 1..<n {
//                    if (arr[i] > arr[i-1]) {
//                        nums[i] = nums[i-1]+1
//                    }
//                }
//                var res = nums[arr.count-1]
//                for i in (0...arr.count-2).reversed() {
//                    if (arr[i] > arr[i+1] && nums[i] <= nums[i+1]) {
//                        nums[i] = nums[i+1] + 1
//                    }
//                    res += nums[i]
//                }
//                return res
//    }
    // 排名第一的答案，处理方式更直观，但是糖果相等的情况两人的糖果数不一样 amazing，题目本身垃圾
    func candy ( _ arr: [Int]) -> Int {
        let n = arr.count
        if (n<=1) {
            return n
        }
        var nums = [Int](repeating:1, count:n)
        for i in 1..<n {
            if (arr[i] > arr[i-1]) {
                nums[i] = nums[i-1]+1
            }
        }
        var res = nums[arr.count-1]
        for i in (0...arr.count-2).reversed() {
            if (arr[i] > arr[i+1] && nums[i] <= nums[i+1]) {
                nums[i] = nums[i+1] + 1
            }
            res += nums[i]
        }
        return res
    }
}

let s = Solution()
assert(s.candy([1,3,8,7,6,6,5,5,4,1,3]) == 33)// 1,2,6,5,4,4,3,3,2,1,2
assert(s.candy([4,4,4]) == 3)
assert(s.candy([1,3,8,1]) == 7)
assert(s.candy([1,3,8,1,1,3,8,1]) == 7)
assert(s.candy([8,1,3]) == 5)
assert(s.candy([1,3,8]) == 6)
assert(s.candy([8,3,1]) == 6)
assert(s.candy([1,8,3,1]) == 7)
print("done")

