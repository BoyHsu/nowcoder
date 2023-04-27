//
//  main.swift
//  StringAdd
//
//  Created by 徐恩 on 2023/4/27.
//

import Foundation

public class Solution {
    func solve ( _ s: String,  _ t: String) -> String {
        let mod = Int(1e18)
        let bits = 18
        var carryBit = 0
        var i0 = s.count-1, i1 = t.count-1
        var res = [String]()
        while i0 >= 0 || i1 >= 0 {
            var sum = carryBit
            if i0 >= 0 {
                let begin = s.index(s.startIndex, offsetBy: max(0, i0-bits+1))
                let end = s.index(s.startIndex, offsetBy: i0)
                sum += Int(s[begin...end])!
                i0-=bits
            }
            if i1 >= 0 {
                let begin = t.index(t.startIndex, offsetBy: max(0, i1-bits+1))
                let end = t.index(t.startIndex, offsetBy: i1)
                sum += Int(t[begin...end])!
                i1-=bits
            }
            let numStr = "\(sum%mod)"
            res.append(String(repeating: "0", count: bits-numStr.count) + numStr)
            carryBit = sum / mod
        }
        if carryBit != 0 {
            res.append("\(carryBit)")
        } else if !res.isEmpty {
            var last = res.removeLast()
            while last.first == "0" {
                last.remove(at: last.startIndex)
            }
            if last.isEmpty {
                res.append("0")
            } else {
                res.append(last)
            }
        }
        
        return res.reversed().joined()
    }
//    func solve ( _ s: String,  _ t: String) -> String {
//        var i0 = s.count-1, i1 = t.count-1
//        let chs0 = Array(s), chs1 = Array(t)
//        var carryBit = 0
//        var k = max(s.count, t.count) - 1
//        var res = Array(repeating: Character("0"), count: k+1)
//        var intChars: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
//        while i0 >= 0 || i1 >= 0 {
//            var sum = carryBit
//            if i0 >= 0 {
//                sum += chs0[i0].wholeNumberValue!
//                i0 -= 1
//            }
//            if i1 >= 0 {
//                sum += chs1[i1].wholeNumberValue!
//                i1 -= 1
//            }
//            res[k] = intChars[sum%10]
//            carryBit = sum / 10
//            k -= 1
//        }
//
//        var str = carryBit == 0 ? "" : "1"
//        for ch in res {
//            str.append(ch)
//        }
//        return str
//    }
//    func solve ( _ s: String,  _ t: String) -> String {
//        var i0 = s.count-1, i1 = t.count-1
//        let chs0 = Array(s), chs1 = Array(t)
//        var carryBit = 0
//        var k = max(s.count, t.count) - 1
//        var res = Array(repeating: "0", count: k+1)
//        while i0 >= 0 || i1 >= 0 {
//            var sum = carryBit
//            if i0 >= 0 {
//                sum += chs0[i0].wholeNumberValue!
//                i0 -= 1
//            }
//            if i1 >= 0 {
//                sum += chs1[i1].wholeNumberValue!
//                i1 -= 1
//            }
//            res[k] = "\(sum % 10)"
//            carryBit = sum / 10
//            k -= 1
//        }
//
//        var str = carryBit == 0 ? "" : "1"
//        str.append(contentsOf: res.joined())
//        return str
//    }
}

let s = Solution()
assert(s.solve("1258994789086810959258888307221656691275942378416703768","7007001981958278066472683068554254815482631701142544497") == "8265996771045089025731571375775911506758574079559248265")
assert(s.solve("9","99999999999999999999999999999999999999999999999999999999999994") == "100000000000000000000000000000000000000000000000000000000000003")
assert(s.solve("1","99") == "100")
assert(s.solve("114514","") == "114514")
print("done")

