//
//  main.swift
//  MoreThanHalfNum
//
//  Created by 徐恩 on 2023/4/19.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param numbers int整型一维数组
     * @return int整型
     */
    func MoreThanHalfNum_Solution ( _ numbers: [Int]) -> Int {
        return numbers.sorted()[numbers.count/2]
    }
}

