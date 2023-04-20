//
//  main.swift
//  ThreeSum
//
//  Created by 徐恩 on 2023/4/20.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param num int整型一维数组
     * @return int整型二维数组
     */
    func threeSum ( _ num: [Int]) -> [[Int]] {
        guard num.count >= 3 else { return [] }
        var res: Set<[Int]> = []
        let num0 = num[0]
        let num1 = num[1]
        let arr: [Int]
        if num0 < num1 {
            arr = [num0, num1]
        } else {
            arr = [num1, num0]
        }
        var map = [-(num0+num1): [arr]]
        
        for i in 2..<num.count {
            let n = num[i]
            if i == 4 {
                
            }
            if let seqs = map.removeValue(forKey: n) {
                for var seq in seqs {
                    if seq[0] > n {
                        seq.insert(n, at: 0)
                    } else if seq[1] > n {
                        seq.insert(n, at: 1)
                    } else {
                        seq.append(n)
                    }
                    res.insert(seq)
                }
            }
            for j in 0..<i {
               
                let nj = num[j]
                let target = -(n+nj)
                var arr: [Int]
                if n > nj {
                    arr = [nj, n]
                } else {
                    arr = [n, nj]
                }
                if map[target] != nil {
                    map[target]?.append(arr)
                } else {
                    map[target] = [arr]
                }
            }
        }
        
        return Array(res).sorted { a0, a1 in
            if a0[0] < a1[0] {
                return true
            } else if a0[0] > a1[0] {
                return false
            } else if a0[1] < a1[1] {
                return true
            } else if a0[1] > a1[1] {
                return false
            } else if a0[2] < a1[2] {
                return true
            } else if a0[2] > a1[2] {
                return false
            }
            
            return false
        }
    }
    
    
}

let s = Solution()
assert(s.threeSum([0]) == [])
assert(s.threeSum([-2,0,1,1,2]) == [[-2,0,2],[-2,1,1]])
assert(s.threeSum([-10,0,10,20,-10,-40]) == [[-10,-10,20],[-10,0,10]])


print("done")
