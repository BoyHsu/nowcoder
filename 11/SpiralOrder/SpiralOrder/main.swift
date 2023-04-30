//
//  main.swift
//  SpiralOrder
//
//  Created by 徐恩 on 2023/4/30.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param matrix int整型二维数组
     * @return int整型一维数组
     */
    func spiralOrder ( _ matrix: [[Int]]) -> [Int] {
        let n = matrix.count
        guard n > 0 else { return [] }
        let m = matrix[0].count
        guard m > 0 else { return [] }
        
        var res = [Int]()
        func _spiralOrder(_ s: Int, _ i: Int, _ j: Int) {
            if i == 0 || j == 0 {
                return
            }
            
            if j == 1 {
                for k in s..<s+i {
                    res.append(matrix[k][s])
                }
                return
            }
            
            for k in s..<s+j {
                res.append(matrix[s][k])
            }
            
            if i == 1 {
                return
            }
            
            var leftSides = [Int]()
            for k in s+1..<(s+i-1) {
                leftSides.append(matrix[k][s])
                res.append(matrix[k][s+j-1])
            }
            
            res.append(contentsOf: matrix[s+i-1][s...s+j-1].reversed())
            res.append(contentsOf: leftSides.reversed())
        }
        for i in 0...min(n, m)/2 {
            _spiralOrder(i, n-2*i, m-2*i)
        }
        
        return res
    }
}

let s = Solution()
assert(s.spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]) == [1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10])
assert(s.spiralOrder([[1,2],[3,4],[5,6]]) == [1,2,4,6,5,3])
assert(s.spiralOrder([[1,2,3], [4,5,6]]) == [1,2,3,6,5,4])
assert(s.spiralOrder([[1,2,3], [4,5,6], [7,8,9], [10,11,12]]) == [1,2,3,6,9,12,11,10,7,4,5,8])
assert(s.spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]) == [1,2,3,4,8,12,11,10,9,5,6,7])

assert(s.spiralOrder([[1,2,3], [4,5,6]]) == [1,2,3,6,5,4])
assert(s.spiralOrder([[1,2,3],[4,5,6],[7,8,9]]) == [1,2,3,6,9,8,7,4,5])
assert(s.spiralOrder([]) == [])
assert(s.spiralOrder([[]]) == [])
print("done")

