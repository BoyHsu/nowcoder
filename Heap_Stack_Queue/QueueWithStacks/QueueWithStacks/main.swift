//
//  main.swift
//  QueueWithStacks
//
//  Created by 徐恩 on 2023/4/15.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param node int整型
     * @return 无
     */
    func push ( _ node: Int) {
        input.append(node)
    }

    var input = [Int]()
    var output = [Int]()
    
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param 无
     * @return int整型
     */
    func pop () -> Int {
        if output.isEmpty {
            while !input.isEmpty {
                output.append(input.removeLast())
            }
        }
        return output.removeLast()
    }
}

