//
//  main.swift
//  EditDistance
//
//  Created by 徐恩 on 2023/4/26.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param str1 string字符串
     * @param str2 string字符串
     * @return int整型
     */
    
//    var dp = [[Int?]]()
//    func editDistance(_ str1: String, _ str2: String) -> Int {
//        dp = Array(repeating: Array(repeating: nil, count: str2.count+1), count: str1.count+1)
//        return _editDistance(Array(str1), Array(str2), 0, 0)
//    }
//
//    func _editDistance(_ chs1: [Character], _ chs2: [Character], _ i1: Int, _ i2: Int) -> Int {
//        if let d = dp[i1][i2] {
//            return d
//        }
//
//        if chs1.count == i1 {
//            dp[i1][i2] = chs2.count - i2
//            return chs2.count - i2
//        } else if chs2.count == i2 {
//            dp[i1][i2] = chs1.count - i1
//            return chs1.count - i1
//        }
//
//        var res = 0
//        if chs1[i1] == chs2[i2] {
//            res = _editDistance(chs1, chs2, i1+1, i2+1)
//        } else {
//            let edit = 1 + _editDistance(chs1, chs2, i1+1, i2+1)
//            let insert = 1 + _editDistance(chs1, chs2, i1, i2+1)
//            let delete = 1 + _editDistance(chs1, chs2, i1+1, i2)
//            res = min(edit, insert, delete)
//        }
//        dp[i1][i2] = res
//        return res
//    }
    
//    func editDistance ( _ str1: String,  _ str2: String) -> Int {
//        if str1.count == 0 {
//            return str2.count
//        } else if str2.count == 0 {
//            return str1.count
//        }
//
//        let idx1 = str1.index(after: str1.startIndex)
//        let idx2 = str2.index(after: str2.startIndex)
//        if str1[str1.startIndex] == str2[str2.startIndex] {
//            return editDistance(String(str1[idx1..<str1.endIndex]), String(str2[idx2..<str2.endIndex]))
//        } else {
//            let edit = 1 + editDistance(String(str1[idx1..<str1.endIndex]), String(str2[idx2..<str2.endIndex]))
//            let insert = 1 + editDistance(String(str1[str1.startIndex..<str1.endIndex]), String(str2[idx2..<str2.endIndex]))
//            let delete = 1 + editDistance(String(str1[idx1..<str1.endIndex]), String(str2[str2.startIndex..<str2.endIndex]))
//            return min(edit, insert, delete)
//        }
//    }
    
    func editDistance ( _ str1: String,  _ str2: String) -> Int {
        let n = str1.count, m = str2.count
    
        var dp = Array(repeating: [Int](repeating: 0, count: m+1), count: n+1)
        let chs1 = Array(str1), chs2 = Array(str2)
        
        for i in 0..<n {
            dp[i][m] = n-i
        }
        
        for i in 0..<m {
            dp[n][i] = m-i
        }
        
        for i in (0..<n).reversed() {
            for j in (0..<m).reversed() {
                if chs1[i] == chs2[j] {
                    dp[i][j] = dp[i+1][j+1]
                } else {
                    dp[i][j] = 1 + min(dp[i+1][j+1], dp[i][j+1], dp[i+1][j])
                }
            }
        }
        return dp[0][0]
    }
}

let s = Solution()
assert(s.editDistance("nowcoder","new") == 6)
assert(s.editDistance("klorel","lnmpap") == 6)
assert(s.editDistance("intention","execution") == 5)
assert(s.editDistance("now","nowcoder") == 5)
assert(s.editDistance("sad", "sadness") == 4)
assert(s.editDistance("sadness", "sad") == 4)
print("done")

