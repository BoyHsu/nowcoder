//
//  main.swift
//  ParenthesesIsValid
//
//  Created by 徐恩 on 2023/4/17.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param s string字符串
     * @return bool布尔型
     */
    func isValid ( _ s: String) -> Bool {
        let chs = Array(s)
        var stack = [Character]()
        let openParenthesis = Character("(")
        let closingParenthesis = Character(")")
        let openBracket = Character("[")
        let closingBracket = Character("]")
        let openCurly = Character("{")
        let closingCurly = Character("}")
        
        for ch in chs {
            if stack.isEmpty {
                if ch == closingParenthesis ||
                    ch == closingBracket ||
                    ch == closingCurly {
                    return false
                } else {
                    stack.append(ch)
                }
            } else {
                if ch == closingParenthesis {
                    if stack.last == openParenthesis {
                        _ = stack.popLast()
                    } else {
                        return false
                    }
                } else if ch == closingBracket {
                    if stack.last == openBracket {
                        _ = stack.popLast()
                    } else {
                        return false
                    }
                } else if ch == closingCurly {
                    if stack.last == openCurly {
                        _ = stack.popLast()
                    } else {
                        return false
                    }
                } else {
                    stack.append(ch)
                }
            }
        }
        
        return stack.isEmpty
    }
}

let s = Solution()
assert(s.isValid("()") == true)
print("done")

