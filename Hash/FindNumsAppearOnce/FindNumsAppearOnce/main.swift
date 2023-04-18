//
//  main.swift
//  FindNumsAppearOnce
//
//  Created by 徐恩 on 2023/4/19.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param array int整型一维数组
     * @return int整型一维数组
     */
    func FindNumsAppearOnce ( _ array: [Int]) -> [Int] {
        var set: Set<Int> = []
        for num in array {
            if set.remove(num) == nil {
                set.insert(num)
            }
        }
        var res = [Int]()
        for num in set {
            if (res.first ?? 0) > num {
                res.insert(num, at: 0)
            } else {
                res.append(num)
            }
        }
        return res
    }
}

