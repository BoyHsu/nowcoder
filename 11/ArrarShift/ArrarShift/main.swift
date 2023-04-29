//
//  main.swift
//  ArrarShift
//
//  Created by 徐恩 on 2023/4/30.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     * 旋转数组
     * @param n int整型 数组长度
     * @param m int整型 右移距离
     * @param a int整型一维数组 给定数组
     * @return int整型一维数组
     */
//    func solve ( _ n: Int,  _ m: Int,  _ a: [Int]) -> [Int] {
//        let m = m % n
//        if m == 0 {
//            return a
//        }
//        var res = a
//        for i in res.indices {
//            res[i] = a[(i+n-m)%n]
//        }
//        return res
//    }
    
    func solve ( _ n: Int,  _ m: Int,  _ a: [Int]) -> [Int] {
        let m = m % n
        if m == 0 {
            return a
        }
        var res = a
        
        func reverse(_ from: Int, _ to: Int) {
            for i in 0...(to-from)/2 {
                let temp = res[from+i]
                res[from+i] = res[to-i]
                res[to-i] = temp
            }
        }
        reverse(0, res.count-1)
        reverse(0, m-1)
        reverse(m, res.count-1)
        
        return res
    }
    
    
}

let s = Solution()
assert(s.solve(6,2,[1,2,3,4,5,6]) == [5,6,1,2,3,4])
assert(s.solve(6,8,[1,2,3,4,5,6]) == [5,6,1,2,3,4])
assert(s.solve(7,3,[1,2,3,4,5,6,7]) == [5,6,7,1,2,3,4])
assert(s.solve(7,2,[1,2,3,4,5,6,7]) == [6,7,1,2,3,4,5])
assert(s.solve(4,0,[1,2,3,4]) == [1,2,3,4])
assert(s.solve(4,8,[1,2,3,4]) == [1,2,3,4])
print("done")

