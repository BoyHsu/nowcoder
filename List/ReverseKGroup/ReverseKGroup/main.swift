//
//  main.swift
//  ReverseKGroup
//
//  Created by 徐恩 on 2023/4/13.
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
     * @param k int整型
     * @return ListNode类
     */
    func reverseKGroup ( _ head: ListNode?,  _ k: Int) -> ListNode? {
        var newHead: ListNode? = nil, lastTrail: ListNode? = nil
        var p = head
        while p != nil {
            var node = p
            var i = 0
            while node != nil, i < k {
                node = node?.next
                i += 1
            }
            node = p
            if i == k {
                var last: ListNode? = nil
                for _ in 0..<k {
                    let next = p?.next
                    p?.next = last
                    last = p
                    p = next
                }
                if newHead == nil {
                    newHead = last
                }
                lastTrail?.next = last
            } else {
                lastTrail?.next = p
                break
            }
            lastTrail = node
        }
        
        return newHead ?? head
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
assert(s.reverseKGroup(makeNumList(nums: [1, 2, 3, 4, 5]), 2).toArr() == makeNumList(nums: [2, 1, 4, 3, 5]).toArr())
assert(s.reverseKGroup(makeNumList(nums: [1, 2, 3, 4, 5, 6, 7]), 3).toArr() == makeNumList(nums: [3, 2, 1, 6, 5, 4, 7]).toArr())
assert(s.reverseKGroup(makeNumList(nums: [1, 2, 3, 4, 5, 6]), 3).toArr() == makeNumList(nums: [3, 2, 1, 6, 5, 4]).toArr())
assert(s.reverseKGroup(makeNumList(nums: [1, 2]), 3).toArr() == makeNumList(nums: [1, 2]).toArr())
print("done")
