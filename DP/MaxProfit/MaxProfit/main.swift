//
//  main.swift
//  MaxProfit
//
//  Created by 徐恩 on 2023/4/26.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param prices int整型一维数组
     * @return int整型
     */
    func maxProfit ( _ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0
        }
        
        var minPrice = prices[0], res = 0
        for i in 1..<prices.count {
            let price = prices[i]
            if price > minPrice {
                res = max(res, price-minPrice)
            } else {
                minPrice = price
            }
        }
        return res
    }
}

let s = Solution()
assert(s.maxProfit([8,9,2,5,4,7,1]) == 5)
assert(s.maxProfit([3,2,1]) == 0)
assert(s.maxProfit([2,4,1]) == 2)
print("done")

