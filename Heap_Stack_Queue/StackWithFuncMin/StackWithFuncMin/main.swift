//
//  main.swift
//  StackWithFuncMin
//
//  Created by 徐恩 on 2023/4/15.
//

import Foundation

public class Solution {
    var stack = [Int]()
    var sorted = [Int]()
    
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param value int整型
     * @return 无
     */
    func push ( _ value: Int) {
        // write code here
        stack.append(value)
        let idx = indexInSorted(value)
        sorted.insert(value, at: idx)
    }
    
    func indexInSorted(_ value: Int) -> Int {
        var lo = 0, hi = sorted.count - 1;
        while (lo <= hi) {
            let mid = ((hi - lo) >> 1) + lo;
            if (value <= sorted[mid])
            {
                hi = mid - 1;
            }
            else
            {
                lo = mid + 1;
            }
        }
        return lo
    }
    
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param 无
     * @return 无
     */
    func pop () {
        // write code here
        let val = stack.popLast()!
        let idx = indexInSorted(val)
        sorted.remove(at: idx)
    }
    
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param 无
     * @return int整型
     */
    func top () -> Int {
        // write code here
        stack.last!
    }
    
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     *
     * @param 无
     * @return int整型
     */
    func min () -> Int {
        // write code here
        sorted.first!
    }
}

let s = Solution()
s.push(-1)
s.push(2)
s.pop()
s.pop()
print("done")

