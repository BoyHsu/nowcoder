//
//  main.swift
//  Evaluation
//
//  Created by 徐恩 on 2023/4/18.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 返回表达式的值
     * @param s string字符串 待计算的表达式
     * @return int整型
     */
    func solve ( _ s: String) -> Int {
        var nums = [Int]()
        var symbols = [Character]()
        let chs = Array(s)
        var pre = [Any]()
        var numVal: Int? = nil
        for ch in chs {
            if ch.isWholeNumber {
                numVal = (numVal ?? 0) * 10 + ch.wholeNumberValue!
            } else {
                if let numVal = numVal {
                    pre.append(numVal)
                }
                numVal = nil
                pre.append(ch)
            }
        }
        if let numVal = numVal {
            pre.append(numVal)
        }
        
        for item in pre {
            if let num = item as? Int {
                if symbols.last == "*" {
                    let left = nums.removeLast()
                    symbols.removeLast()
                    nums.append(left * num)
                } else {
                    nums.append(num)
                }
            } else if let ch = item as? Character {
                if ch != ")" {
                    symbols.append(ch)
                } else {
                    while let sym = symbols.popLast(), sym != "(" {
                        let right = nums.removeLast()
                        let left = nums.removeLast()
                        if sym == "+" {
                            nums.append(left + right)
                        } else if sym == "-" {
                            nums.append(left - right)
                        } else if sym == "*" {
                            nums.append(left * right)
                        }
                    }
                }
            }
        }
        
        while let sym = symbols.popLast() {
            let right = nums.removeLast()
            let left = nums.removeLast()
            if sym == "+" {
                nums.append(left + right)
            } else if sym == "-" {
                if let last = symbols.last, last == "-" {
                    nums.append(left + right)
                } else {
                    nums.append(left - right)
                }
            } else if sym == "*" {
                nums.append(left * right)
            }
        }
        
        return nums.first!
    }
}

let s = Solution()
assert(s.solve("1-2-3-4") == -8)
assert(s.solve("1-2-3") == -4)
assert(s.solve("100+100") == 200)
assert(s.solve("3+5*2") == 13)
assert(s.solve("2*2-2*2") == 0)
assert(s.solve("2*2+2*2") == 8)
assert(s.solve("3+5-2*2") == 4)
assert(s.solve("5*(1+2+3)") == 30)
assert(s.solve("5*(2*3+4)") == 50)
assert(s.solve("5*(4-5)") == -5)
assert(s.solve("2-5*(4-5)") == 7)
assert(s.solve("2-5*(6-5)") == -3)
assert(s.solve("(2*(3-4))*5") == -10)
print("done")

