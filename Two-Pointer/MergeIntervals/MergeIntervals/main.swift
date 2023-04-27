//
//  main.swift
//  MergeIntervals
//
//  Created by 徐恩 on 2023/4/27.
//

import Foundation


public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int = 0, _ end: Int = 0) {
        self.start = start
        self.end = end
    }
}


public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param intervals Interval类一维数组
     * @return Interval类一维数组
     */
    func merge ( _ intervals: [Interval]) -> [Interval] {
        guard !intervals.isEmpty else { return [] }
        var res = [intervals[0]]
        
        func indexInRes(_ val: Int) -> Int {
            var lo = 0, hi = res.count
            while lo < hi {
                let mi = (lo+hi)/2
                if res[mi].start > val {
                    hi = mi
                } else {
                    lo = mi + 1
                }
            }
            return lo
        }
        
        for i in 1..<intervals.count {
            let interval = intervals[i]
            let si = indexInRes(interval.start)
            let ei = indexInRes(interval.end)
            
            if si != ei {
                interval.end = max(interval.end, res[ei-1].end)
                res.removeSubrange(si..<ei)
            }
            if si > 0, res[si-1].end >= interval.start {
                res[si-1].end = max(res[si-1].end, interval.end)
            } else {
                res.insert(interval, at: si)
            }
        }
        return res
    }
}

extension [Interval] {
    static func ==(l: [Interval], r: [Interval]) -> Bool {
        if l.count != r.count {
            return false
        }
        for i in l.indices {
            if l[i].start != r[i].start || l[i].start != r[i].start {
                return false
            }
        }
        return true
    }
}

let s = Solution()
assert(s.merge([Interval(20,30), Interval(40, 50)]) == [Interval(20,30), Interval(40, 50)])
assert(s.merge([Interval(40, 50), Interval(20,30)]) == [Interval(20,30), Interval(40, 50)])
assert(s.merge([Interval(20,40), Interval(30, 50)]) == [Interval(20,50)])
assert(s.merge([Interval(20,25), Interval(30,40), Interval(20, 50)]) == [Interval(20,50)])
print("done")

