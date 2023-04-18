//
//  main.swift
//  GetMedian
//
//  Created by 徐恩 on 2023/4/18.
//

import Foundation

public class Solution {
    var nums = [Int]()
    
    func Insert ( _ num: Int) {
        var lo = 0, hi = nums.count
        while lo < hi {
            let mi = (lo + hi) >> 1
            if nums[mi] > num {
                hi = mi
            } else {
                lo = mi + 1
            }
        }
        nums.insert(num, at: lo)
    }

    
    func GetMedian () -> Double {
        let left = (nums.count - 1) >> 1
        let right = nums.count >> 1
        return Double(nums[left] + nums[right]) / 2
    }
}

