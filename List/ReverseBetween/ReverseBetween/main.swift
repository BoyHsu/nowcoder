//
//  main.swift
//  ReverseBetween
//
//  Created by 徐恩 on 2023/4/12.
//

import Foundation


public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int = 0, _ next: ListNode? = nil) {
    self.val = val
    self.next = next
  }
}


public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param head ListNode类
     * @param m int整型
     * @param n int整型
     * @return ListNode类
     */
    func reverseBetween ( _ head: ListNode?,  _ m: Int,  _ n: Int) -> ListNode? {
        var prev: ListNode? = nil
        for _ in 1..<m {
            prev = prev == nil ? head : prev?.next
        }
        var last: ListNode? = nil
        var p = prev?.next ?? head
        for _ in m..<n {
            let next = p?.next
            p?.next = last
            last = p
            p = next
        }
        
        let succ = p?.next
        p?.next = last
        (prev?.next ?? head)?.next = succ
        prev?.next = p
        
        return prev == nil ? p : head
    }
}

func makeNumList(nums: [Int]) -> ListNode? {
    var head: ListNode? = nil
    var p: ListNode? = nil
    for num in nums {
        let node = ListNode(num)
        p?.next = node
        p = node
        if head == nil {
            head = p
        }
    }
    return head
}

extension ListNode? {
    func toArr() -> [Int] {
        var res = [Int]()
        var node: ListNode? = self
        while node != nil {
            res.append(node!.val)
            node = node?.next
        }
        return res
    }
}

let s = Solution()
assert(s.reverseBetween(makeNumList(nums: [1,2,3,4,5]), 2, 4).toArr() == makeNumList(nums: [1,4,3,2,5]).toArr())
assert(s.reverseBetween(makeNumList(nums: [1,2,3,4,5]), 1, 4).toArr() == makeNumList(nums: [4,3,2,1,5]).toArr())
assert(s.reverseBetween(makeNumList(nums: [1,2,3,4,5]), 1, 5).toArr() == makeNumList(nums: [5,4,3,2,1]).toArr())
assert(s.reverseBetween(makeNumList(nums: [5]), 1, 1).toArr() == makeNumList(nums: [5]).toArr())
assert(s.reverseBetween(makeNumList(nums: []), 1, 1).toArr() == [])
print("done")
