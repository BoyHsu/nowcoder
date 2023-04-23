//
//  main.swift
//  GenerateParenthesis
//
//  Created by 徐恩 on 2023/4/23.
//

import Foundation



public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param n int整型
     * @return string字符串一维数组
     */
    func generateParenthesis ( _ n: Int) -> [String] {
        _generateParenthesis("", n, n)
        return res
    }
    
    var res = [String]()
    
    func _generateParenthesis(_ parenthesis: String, _ opening: Int, _ closing: Int) {
        if closing == 0 {
            res.append(parenthesis)
            return
        }
        
        if opening > 0 {
            _generateParenthesis(parenthesis + "(", opening-1, closing)
        }
        if opening != closing {
            _generateParenthesis(parenthesis + ")", opening, closing-1)
        }
    }
}

let s = Solution()
assert(s.generateParenthesis(1) == ["()"])
s.res = []
assert(s.generateParenthesis(2) == ["(())","()()"])

print("done")

