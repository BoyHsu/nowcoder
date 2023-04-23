//
//  main.swift
//  LCS_II
//
//  Created by 徐恩 on 2023/4/23.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * longest common subsequence
     * @param s1 string字符串 the string
     * @param s2 string字符串 the string
     * @return string字符串
     */
    func LCS ( _ s1: String,  _ s2: String) -> String {
        let chs1 = Array(s1), chs2 = Array(s2)
        let c1 = chs1.count, c2 = chs2.count
        var dp = Array(repeating: Array(repeating: 0, count: c2+1), count: c1+1)
        for i in chs1.indices.reversed() {
            for j in chs2.indices.reversed() {
                if chs1[i] == chs2[j] {
                    dp[i][j] = dp[i+1][j+1]+1
                } else {
                    dp[i][j] = max(dp[i+1][j], dp[i][j+1])
                }
            }
        }
        
        var i = 0, j = 0
        var res = ""
        while i < c1, j < c2 {
            if chs1[i] == chs2[j] {
                res.append(chs1[i])
                i += 1
                j += 1
            } else {
                if dp[i+1][j] > dp[i][j+1] {
                    i+=1
                } else {
                    j+=1
                }
            }
        }
        
        return res.isEmpty ? "-1" : res
    }
}

let s = Solution()
//assert(s.LCS("1A2C3D4B56","B1D23A456A") == "123456")
//assert(s.LCS("abc","abc") == "abc")
//assert(s.LCS("abc","def") == "-1")
assert(s.LCS("1a1a31","1a231") == "1a31")
print("done")

