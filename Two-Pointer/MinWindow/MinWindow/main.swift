//
//  main.swift
//  MinWindow
//
//  Created by 徐恩 on 2023/4/27.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param S string字符串
     * @param T string字符串
     * @return string字符串
     */
    func minWindow ( _ S: String,  _ T: String) -> String {// wrong answer
        
        var mapT = [Character: Int]()
        for ch in T {
            mapT[ch] = (mapT[ch] ?? 0) + 1
        }
        
        
        
        var minL = -1, minR = Int.max/2
        var l = 0, r = 0
        let chs = Array(S)
        
        let chsCount = chs.count
        let upperBound = chs.count-T.count
        while l < upperBound {
            if mapT[chs[l]] != nil {
                r = l
                var map = mapT
                while r < chsCount {
                    if let count = map[chs[r]] {
                        if count == 1 {
                            map.removeValue(forKey: chs[r])
                            if map.keys.isEmpty {
                                if r-l < minR - minL {
                                    minR = r
                                    minL = l
                                }
                                break
                            }
                        } else {
                            map[chs[r]] = count-1
                        }
                    }
                    r += 1
                }
                if r == chsCount, map.keys.isEmpty, r-l < minR - minL {
                    minR = r
                    minL = l
                }
                l = r + 1
            } else {
                l += 1
            }
        }
        
        if minL == -1 {
            return ""
        }
        
        let idxL = S.index(S.startIndex, offsetBy: minL)
        let idxR = S.index(S.startIndex, offsetBy: minR)
        return String(S[idxL...idxR])
    }
}

let s = Solution()
assert(s.minWindow("wyqaalfdtavrmkvrgbrmauenibfxrzjpzzqzlveexayjkvdsyueboloymtvfugvtgnutkyzhaztlvwdvqkwgvmejhbpdimwqbslnrkutkpehnkefwblrprcxvtaffzxitivmssgehklvwqastojihmhcfkhnlexemtrhnxlujxrgpuyiikspycufodubisfwnydaxrwhqqpfkppuzjlzlfhbjbcttkriixkiohpexgjjvafxjqyvyfyjhbccltlvsvdgeumdavoyxtvhmtekzctidxkqsxmlvrrzmefobtmznhizdmlcoemudwkvuyirscqegvsjrfkgoshrgsvvyhrbgdycehtwjlcrjucabpgsjnjqhhnfqeiwhgalptjyflpoiuqjjwdslpiswvxobfljnnwdhgdortezpulysoqddbxbwuqabdjqqhtzpxpjsvkjrvhjmzoralvzhlzkqkbgrwijvzspvcymafymfmfhaaghnfsdrvmlruuntmcqqbdqideprkxrmfbanvfeqrphnlwjxbzqcegmhnczxbslitnvotaemroadkjclksppzeyoiznlsytnopchritiyvlleqypiqgjugxeikpclipzxtgoebxcxkpdaoulecuajueretvpbkqbgwrkaooxbeaduvoaxlaifgblzwdcjtfpsxbsnrrovturokrovtycbcqcytfjomygj","baxtr") == "blrprcxvta")
assert(s.minWindow("XDOYEZODEYXNZ","XYZ") == "YXNZ")
assert(s.minWindow("abcAbA","AA") == "AbA")
print("done")

