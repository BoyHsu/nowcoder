//
//  main.swift
//  Permutation
//
//  Created by 徐恩 on 2023/4/22.
//

import Foundation

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param str string字符串
     * @return string字符串一维数组
     */
    
    var chs = [Character]()
    var visited = [Bool]()
    var sequence = ""
    var res: Set<String> = []
    func Permutation ( _ str: String) -> [String] {
        chs = Array(str).sorted()
        visited = Array(repeating: false, count: chs.count)
        _recursivePermutation(0)
        return Array(res)
    }
    
    func _recursivePermutation(_ step: Int) {
        if step >= chs.count {
            res.insert(sequence)
            return
        }
        
        for i in 0..<chs.count {
            if !visited[i] {
                visited[i] = true
                sequence.append(chs[i])
                _recursivePermutation(step+1)
                sequence.removeLast()
                visited[i] = false
            }
        }
    }
}

let s = Solution()
assert(s.Permutation("aba") == ["aab","aba","baa"])
print("done")

