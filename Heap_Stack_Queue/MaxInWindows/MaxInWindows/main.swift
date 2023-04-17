//
//  main.swift
//  MaxInWindows
//
//  Created by 徐恩 on 2023/4/17.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param num int整型一维数组
     * @param size int整型
     * @return int整型一维数组
     */
    func maxInWindows ( _ num: [Int],  _ size: Int) -> [Int] {
        guard size > 0, size <= num.count else {
            return []
        }
        
        var res = [Int]()
        var queue = [Int]()
        
        for i in num.indices {
            while !queue.isEmpty, num[queue.last!] < num[i] {
                queue.removeLast()
            }
            
            queue.append(i)
            
            if queue[0] + size <= i {
                queue.remove(at: 0)
            }
            
            if (i + 1) >= size {
                res.append(num[queue[0]])
            }
        }
        return res
    }
}

let s = Solution()
assert(s.maxInWindows([2,3,4,2,6,2,5,1], 3) == [4,4,6,6,6,5])
assert(s.maxInWindows([9,10,9,-7,-3,8,2,-6], 5) == [10,10,9,8])
assert(s.maxInWindows([1,2,3,4], 5) == [])
print("done")

