//
//  main.swift
//  FindGreatestSumOfSubArray
//
//  Created by 徐恩 on 2023/4/25.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param array int整型一维数组
     * @return int整型
     */
    func FindGreatestSumOfSubArray ( _ array: [Int]) -> Int {
        var res = Int.min, sumOfSub = 0
        for num in array {
            sumOfSub = max(sumOfSub+num, num)
            res = max(sumOfSub, res)
        }
        return res
    }
}

