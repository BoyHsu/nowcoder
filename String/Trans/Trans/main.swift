//
//  main.swift
//  Trans
//
//  Created by 徐恩 on 2023/4/27.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param s string字符串
     * @param n int整型
     * @return string字符串
     */
    func trans ( _ s: String,  _ n: Int) -> String {
        var arr = [String]()
        var str = ""
        for ch in Array(s) {
            if ch == " " {
                arr.append(str)
                arr.append(" ")
                str.removeAll(keepingCapacity: true)
                continue
            }
            if ch.isUppercase {
                str.append(ch.lowercased())
            } else {
                str.append(ch.uppercased())
            }
        }
        
        if !str.isEmpty {
            arr.append(str)
        }
        
        return arr.reversed().joined()
    }
}

let s = Solution()
assert(s.trans("This is a sample",16) == "SAMPLE A IS tHIS")
assert(s.trans("nowcoder",8) == "NOWCODER")
assert(s.trans("iOS",3) == "Ios")
assert(s.trans("h i ",4) == " I H")
assert(s.trans(" h i ",4) == " I H ")
assert(s.trans(" h i",4) == "I H ")
print("done")

