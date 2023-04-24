//
//  main.swift
//  MinPathSum
//
//  Created by 徐恩 on 2023/4/23.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param matrix int整型二维数组 the matrix
     * @return int整型
     */
    
    func minPathSum(_ matrix: [[Int]]) -> Int {
        var dp = matrix
        let row = matrix.count, col = matrix[0].count
        for i in 0..<row {
            for j in 0..<col {
                if i > 0, j > 0 {
                    dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + dp[i][j]
                } else {
                    if i == 0, j > 0 {
                        dp[0][j] += dp[0][j-1]
                    } else if i > 0, j == 0 {
                        dp[i][0] += dp[i-1][0]
                    }
                }
            }
        }
        return dp.last!.last!
    }
    
//    func minPathSum(_ matrix: [[Int]]) -> Int {
//        var dp = Array(repeating: Int.max/2, count: matrix[0].count)
//        dp[0] = 0
//        var last = 0
//        for row in matrix {
//            for i in row.indices {
//                let num = row[i]
//                if i == 0 {
//                    last = dp[i] + num
//                } else {
//                    last = min(dp[i], last) + num
//                }
//                dp[i] = last
//            }
//        }
//        return dp.last!
//    }
}

let s = Solution()
assert(s.minPathSum([[1,2,3],[1,2,3]]) == 7)
assert(s.minPathSum([[1,3,5,9],[8,1,3,4],[5,0,6,1],[8,8,4,0]]) == 12)
print("done")

