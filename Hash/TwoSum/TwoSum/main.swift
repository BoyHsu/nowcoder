//
//  main.swift
//  TwoSum
//
//  Created by 徐恩 on 2023/4/18.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param numbers int整型一维数组
     * @param target int整型
     * @return int整型一维数组
     */
    func twoSum ( _ numbers: [Int],  _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for i in numbers.indices {
            let number = numbers[i]
            if let targetIdx = dict[target - number] {
                return [targetIdx, i]
            } else {
                dict[number] = i
            }
        }
        return []
    }
}

