//
//  main.swift
//  LongestCommonPrefix
//
//  Created by 徐恩 on 2023/4/27.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param strs string字符串一维数组
     * @return string字符串
     */
    func longestCommonPrefix ( _ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        var lcp = strs[0]
        
        for i in 1..<strs.count {
            while strs[i].hasPrefix(lcp)==false{
                lcp.removeLast()
            }
        }
        
        return String(lcp)
    }
}

let s = Solution()
assert(s.longestCommonPrefix(["abca","abc","abca","abc","abcc"]) == "abc")
assert(s.longestCommonPrefix(["aba","abc","abca","abc","abcc"]) == "ab")
assert(s.longestCommonPrefix(["abc"]) == "abc")
assert(s.longestCommonPrefix(["abc", "ab"]) == "ab")
print("done")

