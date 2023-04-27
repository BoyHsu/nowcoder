//
//  main.swift
//  Judge
//
//  Created by 徐恩 on 2023/4/27.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param str string字符串 待判断的字符串
     * @return bool布尔型
     */
    func judge(_ str: String) -> Bool {
        let chs = Array(str)
        let maxIndex = chs.count-1
        for i in 0...maxIndex/2 {
            if chs[i] != chs[maxIndex-i] {
                return false
            }
        }
        return true
    }
}

