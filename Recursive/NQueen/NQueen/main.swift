//
//  main.swift
//  NQueen
//
//  Created by 徐恩 on 2023/4/22.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param n int整型 the n
     * @return int整型
     */
    
    var res = 0
    var columns = [Bool]()
    var posSlant = Set<Int>()
    var backSlant = Set<Int>()
    var n = 0
    func Nqueen ( _ n: Int) -> Int {
        self.n = n
        columns = Array(repeating: false, count: n)
        solve(0)
        return res
    }
    
    func solve(_ i: Int) {
        if i == n {
            res += 1
            return
        }
        
        for j in 0..<n {
            if columns[j] || posSlant.contains(i+j) || backSlant.contains(i-j) {
                continue
            }
            columns[j] = true
            posSlant.insert(i+j)
            backSlant.insert(i-j)
            solve(i+1)
            backSlant.remove(i-j)
            posSlant.remove(i+j)
            columns[j] = false
        }
    }
}

let s = Solution()
assert(s.Nqueen(8) == 92)
s.res = 0
assert(s.Nqueen(4) == 2)
print("done")

