//
//  main.swift
//  LCS
//
//  Created by 徐恩 on 2023/4/23.
//

import Foundation



public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * longest common substring
     * @param str1 string字符串 the string
     * @param str2 string字符串 the string
     * @return string字符串
     */
    
    func LCS( _ str1: String,  _ str2: String) -> String {
        let chs1 = Array(str1), chs2 = Array(str2)
        let c1 = chs1.count, c2 = chs2.count
        var dp = Array(repeating: (0, 0), count: c1+1)
        
        for i in (0..<c1).reversed() {
            for j in (0..<c2).reversed() {
                var ni = i , nj = j
                while ni >= 0, nj >= 0, chs1[ni] == chs2[nj] {
                    ni -= 1; nj -= 1
                }
                
                let (_, c1) = dp[i]
                let (_, c2) = dp[i+1]
                let maxC = max(c1, c2, i-ni)
                if maxC == i-ni {
                    dp[i] = (i, i-ni)
                } else {
                    if maxC == c2 {
                        dp[i] = dp[i+1]
                    }
                }
            }
        }
        
        let (idx, c) = dp[0]
        return c == 0 ? "-1" : String(chs1[idx-c+1...idx])
    }
    
//    func LCS( _ str1: String,  _ str2: String) -> String {
//        let chs1 = Array(str1), chs2 = Array(str2)
//        let c1 = chs1.count, c2 = chs2.count
//        var dp = Array(repeating: "", count: c1)
//
//        for i in chs1.indices {
//            for j in chs2.indices {
//                var ni = i, nj = j
//                while ni < c1, nj < c2 , chs1[ni] == chs2[nj] {
//                    ni += 1; nj += 1
//                }
//
//                if i == 0 {
//                    if dp[i].count <= ni-i {
//                        dp[i] = String(chs1[i..<ni])
//                    }
//                } else {
//                    let max = max(dp[i].count, dp[i-1].count, ni-i)
//                    if max == ni-i {
//                        dp[i] = String(chs1[i..<ni])
//                    } else {
//                        if max != dp[i].count {
//                            dp[i] = dp[i-1]
//                        }
//                    }
//                }
//            }
//        }
//        let res = dp.last!
//        return res.count == 1 ? "-1" : res
//    }
    
//    func LCS( _ str1: String,  _ str2: String) -> String {
//        let res = _LCS(Array(str1), Array(str2), 0, 0)
//        return res.isEmpty ? "-1" : res
//    }
//
//    func _LCS(_ chs1: [Character], _ chs2: [Character], _ i1: Int, _ i2: Int) -> String {
//        let c1 = chs1.count, c2 = chs2.count
//        if i1 >= chs1.count || i2 >= chs2.count {
//            return ""
//        }
//        var res = ""
//        var idx1 = i1
//        var idx2 = i2
//
//        while idx1 < c1,
//              idx2 < c2,
//              chs1[idx1] == chs2[idx2]
//        {
//            res.append(chs1[idx1])
//            idx1 += 1
//            idx2 += 1
//        }
//
//        let res1 = _LCS(chs1, chs2, i1+1, i2)
//        let res2 = _LCS(chs1, chs2, i1, i2+1)
//        let max = max(res.count, res1.count, res2.count)
//        if max == res.count {
//            return res
//        } else if max == res1.count {
//            return res1
//        } else {
//            return res2
//        }
//    }
}


let s = Solution()
assert(s.LCS("1AB2345CD","12345EF") == "2345")
assert(s.LCS("12C34","12D3") == "12")
assert(s.LCS("A123D", "1AB23C") == "23")
print("done")

