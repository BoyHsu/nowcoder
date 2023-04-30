//
//  main.swift
//  RotateMatrix
//
//  Created by 徐恩 on 2023/4/30.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param mat int整型二维数组
     * @param n int整型
     * @return int整型二维数组
     */
    func rotateMatrix ( _ mat: [[Int]],  _ n: Int) -> [[Int]] {
        var mat = mat
        var len = n
        for i in 0..<n/2 {
            for j in 0..<(len-1) {
                let m = len-1
                let temp = mat[i][i+j]
                mat[i][i+j] = mat[m-j+i][i]
                mat[m-j+i][i] = mat[m+i][m-j+i]
                mat[m+i][m-j+i] = mat[j+i][m+i]
                mat[j+i][m+i] = temp
            }
            len -= 2
        }
        return mat
    }
}

let s = Solution()
assert(s.rotateMatrix([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]], 4) == [[13,9,5,1],[14,10,6,2],[15,11,7,3],[16,12,8,4]])
assert(s.rotateMatrix([[1,2,3],[4,5,6],[7,8,9]], 3) == [[7,4,1],[8,5,2],[9,6,3]])
assert(s.rotateMatrix([[]], 0) == [[]])
assert(s.rotateMatrix([[1]], 1) == [[1]])
assert(s.rotateMatrix([[1,2],[3,4]], 2) == [[3,1],[4,2]])
print("done")

