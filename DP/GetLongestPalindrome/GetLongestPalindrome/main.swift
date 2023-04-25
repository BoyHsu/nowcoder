//
//  main.swift
//  GetLongestPalindrome
//
//  Created by 徐恩 on 2023/4/25.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param A string字符串
     * @return int整型
     */
    func getLongestPalindrome(_ A: String) -> Int {
        let n = A.count
        dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        for i in 0..<n {
            dp[i][i] = 1
        }
        let res = _getLongestPalindrome(Array(A), 0, n-1)
        return res
    }
    
    var dp = [[Int]]()
    
    func _getLongestPalindrome(_ chs: [Character], _ l: Int, _ r: Int) -> Int {
        if dp[l][r] > 0 {
            return dp[l][r]
        }
        let chl = chs[l]
        let chr = chs[r]
        if l + 1 == r {
            dp[l][r] = chl == chr ? 2 : 1
            return dp[l][r]
        }
        if chs[l] == chs[r] {
          let len = _getLongestPalindrome(chs, l+1, r-1)
            if len + 2 == r - l + 1 {
                dp[l][r] = len + 2
                return dp[l][r]
            } else {
                //fallthrough
            }
        }
        
        dp[l][r] = max(_getLongestPalindrome(chs, l, r-1), _getLongestPalindrome(chs, l+1, r))
        return dp[l][r] 
    }
}

let s = Solution()
assert(s.getLongestPalindrome("ababc") == 3)
assert(s.getLongestPalindrome("ababba") == 4)
assert(s.getLongestPalindrome("abaabaa") == 6)
assert(s.getLongestPalindrome("abbba") == 5)
print("done")

