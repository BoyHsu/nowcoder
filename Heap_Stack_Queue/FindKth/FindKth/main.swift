//
//  main.swift
//  FindKth
//
//  Created by 徐恩 on 2023/4/18.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param a int整型一维数组
     * @param n int整型
     * @param K int整型
     * @return int整型
     */
    func findKth ( _ a: [Int],  _ n: Int,  _ K: Int) -> Int {
        return a.sorted(by: >)[K-1]
    }
}

