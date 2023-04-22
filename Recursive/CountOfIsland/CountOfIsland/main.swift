//
//  main.swift
//  CountOfIsland
//
//  Created by 徐恩 on 2023/4/22.
//

import Foundation



public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 判断岛屿数量
     * @param grid char字符型二维数组
     * @return int整型
     */
    func solve ( _ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else { return 0 }
        let n = grid.count
        let m = grid[0].count
        guard m != 0 else { return 0 }
        
        var res = 0
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        var queue = [(y: Int, x: Int)]()
        
        for i in 0..<n {
            for j in 0..<m {
                if grid[i][j] == "0" || visited[i][j] {
                    continue
                }
                res += 1
                
                queue.append((i, j))
                while !queue.isEmpty {
                    let (Y, X) = queue.removeFirst()
                    if grid[Y][X] == "1" && !visited[Y][X] {
                        visited[Y][X] = true
                        for k in [(1, 0), (-1,0), (0,1), (0,-1)] {
                            let x = X + k.1
                            let y = Y + k.0
                            if 0 <= x && x < m && 0 <= y && y < n {
                                queue.append((y, x))
                            }
                        }
                    }
                }
            }
        }
        
        return res
    }
}

let s = Solution()
assert(s.solve([
    ["1","1","0","0","0"],
    ["0","1","0","1","1"],
    ["0","0","0","1","1"],
    ["0","0","0","0","0"],
    ["0","0","1","1","1"]]) == 3)
assert(s.solve([
    ["1","1","0","0","1"],
    ["0","1","0","1","1"],
    ["0","0","0","1","1"],
    ["0","0","0","0","0"],
    ["0","0","1","1","1"]]) == 3)
assert(s.solve([
    ["1","1","0","0","0"],
    ["0","1","0","1","1"],
    ["0","0","0","1","1"],
    ["0","0","0","0","0"],
    ["1","0","1","1","1"]]) == 4)
assert(s.solve([
    ["1","1","0","0","0"],
    ["0","1","0","1","1"],
    ["0","0","0","1","1"],
    ["0","1","0","0","0"],
    ["1","0","1","1","1"]]) == 5)
assert(s.solve([["1","1"],["1","1"]]) == 1)
assert(s.solve([["1","0"],["0","1"]]) == 2)


print("done")

