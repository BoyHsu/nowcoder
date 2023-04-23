//
//  main.swift
//  Fibonacci
//
//  Created by 徐恩 on 2023/4/23.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param n int整型
     * @return int整型
     */
    func Fibonacci ( _ n: Int) -> Int {
        if n < 3 {
            return 1
        }
        var a = 2, b = 1
        for _ in 3..<n {
            let temp = a
            a = a + b
            b = temp
        }
        return a
    }
}

