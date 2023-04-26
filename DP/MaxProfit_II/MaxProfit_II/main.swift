//
//  main.swift
//  MaxProfit_II
//
//  Created by 徐恩 on 2023/4/27.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 计算最大收益
     * @param prices int整型一维数组 股票每一天的价格
     * @return int整型
     */
    func maxProfit ( _ prices: [Int]) -> Int {
        var res = 0
        for i in 1..<prices.count {
            res += max(0, prices[i]-prices[i-1])
        }
        return res
    }
}

let s = Solution()
assert(s.maxProfit([8,3,3,8,4,9,2,5,4,7,1]) == 16)
assert(s.maxProfit([8,9,2,5,4,7,1]) == 7)
assert(s.maxProfit([1,2,3,4,5]) == 4)
print("done")

