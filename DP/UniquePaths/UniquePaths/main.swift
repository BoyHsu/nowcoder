//
//  main.swift
//  UniquePaths
//
//  Created by 徐恩 on 2023/4/23.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param m int整型
     * @param n int整型
     * @return int整型
     */
    func uniquePaths ( _ m: Int,  _ n: Int) -> Int {
        if m > n {
            return uniquePaths(n, m)
        }
        var n = n
        var res = 1
        var divisor = 1
        for i in (1..<m).reversed() {
            res *= n
            divisor *= i
            let gcd = greatestCommonDivisor(m: res, n: divisor)
            if gcd > 1 {
                res /= gcd
                divisor /= gcd
            }
            n += 1
        }
        return res
    }
    
    func greatestCommonDivisor(m: Int, n: Int) -> Int {
        var min = min(m, n)
        var max = max(m, n)
        var temp = 0
        while max%min != 0 {
            temp = max%min
            max = min
            min = temp
        }
        return min
    }
    
    func uniquePaths2 ( _ m: Int,  _ n: Int) -> Int {
        if m > n {
            return uniquePaths2(n, m)
        }
        
        var dp = Array(repeating: 1, count: n+1)
        dp[0] = 0
        for _ in 1..<m {
            for i in 1...n {
                dp[i] += dp[i-1]
            }
        }
        return dp.last!
    }
}

let s = Solution()
assert(s.uniquePaths(3, 5) == s.uniquePaths2(3, 5))
assert(s.uniquePaths(3, 4) == s.uniquePaths2(3, 4))
assert(s.uniquePaths(4, 5) == s.uniquePaths2(4, 5))
assert(s.uniquePaths(30, 30) == s.uniquePaths2(30, 30))
print("done")

