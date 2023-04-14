//
//  main.swift
//  VersionCompare
//
//  Created by 徐恩 on 2023/4/14.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * 比较版本号
     * @param version1 string字符串
     * @param version2 string字符串
     * @return int整型
     */
    func compare ( _ version1: String,  _ version2: String) -> Int {
        var i1 = 0, i2 = 0
        let chs1 = Array(version1), chs2 = Array(version2)
        let chDot = Character(".")
        while i1 < chs1.count || i2 < chs2.count {
            var val1 = 0, val2 = 0
            while i1 < chs1.count {
                if chs1[i1] == chDot {
                    i1 += 1
                    break
                } else {
                    val1 = chs1[i1].wholeNumberValue! + val1 * 10
                    i1 += 1
                }
            }
            
            while i2 < chs2.count {
                if chs2[i2] == chDot {
                    i2 += 1
                    break
                } else {
                    val2 = chs2[i2].wholeNumberValue! + val2 * 10
                    i2 += 1
                }
            }
            
            if val1 > val2 {
                return 1
            } else if val1 < val2 {
                return -1
            }
        }
       
        return 0
    }
}

let s = Solution()
assert(s.compare("0.226","0.38") == 1)
assert(s.compare("101.101.100", "123.321.123") == -1)
assert(s.compare("1.1","1.1.1") == -1)
assert(s.compare("2.0.1","2") == 1)
assert(s.compare("0.226","0.36") == 1)
assert(s.compare("1.1","2.1") == -1)
assert(s.compare("1.1","1.01") == 0)
print("done")
