//
//  main.swift
//  RestoreIpAddresses
//
//  Created by 徐恩 on 2023/4/26.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param s string字符串
     * @return string字符串一维数组
     */
    
    let segCount = 4
    var segments = [String]()
    var res = [String]()
    
    func restoreIpAddresses(_ s: String) -> [String] {
        guard s.count >= segCount else { return [] }
        var chs = Array(s)
        segments = [String](repeating: "", count: segCount)
        dfs(chs, 0, 0)
        return res
    }
    
    func dfs(_ chs: [Character], _ segStart: Int, _ segIndex: Int) {
        if segIndex == segCount, segStart == chs.count {
            res.append(segments.joined(separator: "."))
            return
        }
        
        if segIndex == segCount || segStart == chs.count {
            return
        }
        
        if chs[segStart] == "0" {
            segments[segIndex] = "0"
            dfs(chs, segStart+1, segIndex+1)
        } else {
            var addr = 0
            for i in segStart..<chs.count {
                addr = addr * 10 + chs[i].wholeNumberValue!
                if addr < 256 {
                    segments[segIndex] = "\(addr)"
                    dfs(chs, i+1, segIndex+1)
                } else {
                    break
                }
            }
        }
    }
}

let s = Solution()
assert(s.restoreIpAddresses("25525522135") == ["255.255.22.135","255.255.221.35"])
s.res = []
assert(s.restoreIpAddresses("1111") == ["1.1.1.1"])
s.res = []
assert(s.restoreIpAddresses("000256") == [])
s.res = []
assert(s.restoreIpAddresses("0000") == ["0.0.0.0"])
s.res = []
assert(s.restoreIpAddresses("255255225135") == ["255.255.225.135",])
print("done")

