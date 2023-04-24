//
//  main.swift
//  ConfusionNumToStr
//
//  Created by 徐恩 on 2023/4/24.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 解码
     * @param nums string字符串 数字串
     * @return int整型
     */
    func solve ( _ nums: String) -> Int {
        guard !nums.isEmpty else { return 0 }
        let chs = Array(nums)
        var last = chs[0]
        var res = 1
        if last == "0" {
            res = 0
        }
        var prevRes = res
        for i in 1..<chs.count {
            let ch = chs[i]
            if ch != "0" {
                if res == 0 {
                    res = 1
                }
                if last == "1" || (last == "2" && ch.wholeNumberValue! < 7) {
                    let sum = res + prevRes
                    prevRes = res
                    res = sum
                } else {
                    prevRes = res
                }
            } else if last != "1" && last != "2" {
                    return 0
            }
            
            last = ch
        }
        return res
    }
}

let s = Solution()
assert(s.solve("121212") == 13)
assert(s.solve("31717126241541717") == 192)
assert(s.solve("0121212") == 13)
assert(s.solve("00121212") == 0)
assert(s.solve("12103") == 3)
assert(s.solve("10") == 1)
assert(s.solve("160") == 0)
assert(s.solve("100") == 0)
print("done")

