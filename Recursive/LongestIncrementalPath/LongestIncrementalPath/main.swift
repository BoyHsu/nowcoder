//
//  main.swift
//  LongestIncrementalPath
//
//  Created by 徐恩 on 2023/4/23.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 递增路径的最大长度
     * @param matrix int整型二维数组 描述矩阵的每个数
     * @return int整型
     */
    
    var n = 0
    var m = 0
    var matrix = [[Int]]()
    var dp = [[Int]]()
    func solve ( _ matrix: [[Int]]) -> Int {
        self.matrix = matrix
        var res = 0
        n = matrix.count
        m = matrix[0].count
        dp = Array(repeating: Array(repeating: 0, count: m), count: n)
        for i in 0..<n {
            for j in 0..<m {
                res = max(res, dfs(i, j))
            }
        }
        return res
    }
    
    func dfs(_ x: Int, _ y: Int) -> Int {
        var val = dp[y][x]
        if val == 0 {
            val = 1
            let num = matrix[y][x]
            for (dx, dy) in [(0,1), (0,-1), (1, 0), (-1, 0)] {
                let X = x + dx
                let Y = y + dy
                if X >= 0 , X < m,
                   Y >= 0, Y < n,
                   num < matrix[Y][X]
                {
                    val = max(val, dfs(X, Y)+1)
                }
            }
            dp[y][x] = val
        }
        return val
    }
}

let s = Solution()
assert(s.solve([[1,2],[4,3]]) == 4)
assert(s.solve([[2,1],[3,4]]) == 4)
assert(s.solve([[1,2,3],[4,5,6],[7,8,9]]) == 5)
assert(s.solve([[3,4,5],[2,8,7],[1,6,9]]) == 7)
assert(s.solve([[2,3,4],[8,7,5],[1,6,9]]) == 6)
print("done")

