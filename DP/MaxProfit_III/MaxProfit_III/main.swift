//
//  main.swift
//  MaxProfit_III
//
//  Created by 徐恩 on 2023/4/27.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 两次交易所能获得的最大收益
     * @param prices int整型一维数组 股票每一天的价格
     * @return int整型
     */
    func maxProfit(_ prices: [Int]) -> Int {
        guard let bsp = buySaleAndProfit(prices) else { return 0 }
        
        let left = buySaleAndProfit(Array(prices[0...bsp.buy]))
        let right = buySaleAndProfit(Array(prices[bsp.sale..<prices.count]))
        
        return bsp.profit + max(left?.profit ?? 0, right?.profit ?? 0)
    }
    
    func buySaleAndProfit(_ prices: [Int]) -> (buy: Int, sale: Int, profit: Int)? {
        if prices.count < 2 {
            return nil
        }
        var buy = 0
        var buyPrice = prices[0]
        var res: (buy: Int, sale: Int, profit: Int) = (0, 0, 0)
        for i in 1..<prices.count {
            let p = prices[i]-buyPrice
            if p > res.profit {
                if p > res.profit {
                    res = (buy, i, p)
                }
            }
            if prices[i] < buyPrice {
                buy = i
                buyPrice = prices[i]
            }
        }
        return res
    }
}

let s = Solution()
assert(s.maxProfit([8,9,3,5,1,3]) == 4)
assert(s.maxProfit([9,8,4,1]) == 0)
assert(s.maxProfit([1,2,8,3,8]) == 12)
print("done")

