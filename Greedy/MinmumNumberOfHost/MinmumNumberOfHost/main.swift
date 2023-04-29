//
//  main.swift
//  MinmumNumberOfHost
//
//  Created by 徐恩 on 2023/4/29.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * 计算成功举办活动需要多少名主持人
     * @param n int整型 有n个活动
     * @param startEnd int整型二维数组 startEnd[i][0]用于表示第i个活动的开始时间，startEnd[i][1]表示第i个活动的结束时间
     * @return int整型
     */
//    func minmumNumberOfHost ( _ n: Int,  _ startEnd: [[Int]]) -> Int {// slow answer
//        let starEnd = startEnd.sorted(by: { $0[0] < $1[0] })//
//        var ongoing = [[Int]]()
//        var nextIdx = 0
//        var nextStart = 0
//        var idx = 0
//        var res = 0
//        while idx < starEnd.count {
//            res = max(res, ongoing.count)
//            nextIdx = idx
//            nextStart = starEnd[nextIdx][0]
//            while idx < starEnd.count, starEnd[idx][0] == nextStart {
//                idx += 1
//            }
//            for i in ongoing.indices.reversed() {
//                if ongoing[i][1] <= nextStart {
//                    ongoing.remove(at: i)
//                }
//            }
//            ongoing.append(contentsOf: starEnd[nextIdx..<idx])
//        }
//
//        return max(res, ongoing.count)
//    }
    
//    func minmumNumberOfHost ( _ n: Int,  _ startEnd: [[Int]]) -> Int {// slow answer
//        let startEnd = startEnd.sorted(by: { $0[0] < $1[0] })//
//        var ongoing = [Int]()
//        var nextIdx = 0
//        var nextStart = 0
//        var idx = 0
//        var res = 0
//        while idx < startEnd.count {
//            res = max(res, ongoing.count)
//            nextIdx = idx
//            nextStart = startEnd[nextIdx][0]
//            while idx < startEnd.count, startEnd[idx][0] == nextStart {
//                idx += 1
//            }
//            for i in ongoing.indices.reversed() {
//                if startEnd[ongoing[i]][1] <= nextStart {
//                    ongoing.remove(at: i)
//                }
//            }
//            ongoing.append(contentsOf: nextIdx..<idx)
//        }
//
//        return max(res, ongoing.count)
//    }
    
//    func minmumNumberOfHost ( _ n: Int,  _ startEnd: [[Int]]) -> Int {// wrong answer
//        var timeTable = [Int]()
//        var countTable = [Int]()
//
//        func index(_ val: Int, from: Int = 0) -> Int {
//            var lo = from, hi = timeTable.count
//            while lo < hi {
//                let mi = (lo+hi)/2
//                if timeTable[mi] > val {
//                    hi = mi
//                } else {
//                    lo = mi+1
//                }
//            }
//            return lo
//        }
//
//        for se in startEnd {
//            var si = index(se[0])
//            if si == 0 || timeTable[si-1] != se[0] {
//                timeTable.insert(se[0], at: si)
//                countTable.insert(0, at: si)
//            } else {
//                si -= 1
//            }
//            var ei = index(se[1], from: si+1)
//            if timeTable[ei-1] != se[1] {
//                timeTable.insert(se[1], at: ei)
//                countTable.insert(0, at: ei)
//            } else {
//                ei -= 1
//            }
//            print(ei+si)
//            for i in si...ei {
//                countTable[i] += 1
//            }
//            print(ei+si)
//        }
//        return countTable.max() ?? 0
//    }
        
    func minmumNumberOfHost ( _ n: Int,  _ startEnd: [[Int]]) -> Int {
        let start = startEnd.map {$0[0]} .sorted(by: <)
                let end = startEnd.map {$0[1]} .sorted(by: <)
                var b = 0, total = 0
                for i in 0..<start.count {
                    if start[i] >= end[b] {
                        b += 1
                    } else {
                        total += 1
                    }
                }
                return total
    }
}

let s = Solution()
assert(s.minmumNumberOfHost(48,[[348,813],[340,385],[465,676],[64,400],[744,959],[130,974],[769,963],[269,901],[406,880],[30,980],[439,854],[451,658],[341,650],[40,796],[332,982],[14,647],[777,787],[614,823],[74,545],[114,199],[406,665],[546,943],[577,806],[640,986],[499,866],[392,554],[388,693],[191,622],[586,997],[114,808],[41,775],[52,884],[184,718],[118,938],[224,498],[78,746],[87,672],[117,216],[66,313],[605,874],[41,876],[269,771],[180,368],[462,677],[185,736],[136,188],[178,821],[195,931]]) == 34)
assert(s.minmumNumberOfHost( 10,[
    [2147483646,2147483647],
    [-2147483648,-2147483647],
    [2147483646,2147483647],
    [-2147483648,-2147483647],
    [2147483646,2147483647],
    [-2147483648,-2147483647],
    [2147483646,2147483647],
    [-2147483648,-2147483647],
    [2147483646,2147483647],
    [-2147483648,-2147483647]
]) == 5)
assert(s.minmumNumberOfHost(2, [[1,2],[1,3],[1,4],[2,3],[2,4],[2,5]]) == 5)
print("done")

