//
//  main.swift
//  Merge
//
//  Created by 徐恩 on 2023/4/27.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param A int整型一维数组
     * @param m int整型
     * @param B int整型一维数组
     * @param n int整型
     * @return 无
     */
    func merge ( _ A: inout [Int],  _ m: Int,  _ B: [Int],  _ n: Int) {
        var startA = m - 1
        var startB = n - 1
        var index = m + n - 1
        
        while startA >= 0 && startB >= 0 {
            if A[startA] > B[startB] {
                A[index] = A[startA]
                startA -= 1
            } else {
                A[index] = B[startB]
                startB -= 1
            }
            index -= 1
        }
        
        while startB >= 0 {
            A[index] = B[startB]
            startB -= 1
            index -= 1
        }
    }
}

