//
//  main.swift
//  RemoveNthFromEnd
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
     * @param n int整型
     * @return ListNode类
     */
    func removeNthFromEnd ( _ head: ListNode?,  _ n: Int) -> ListNode? {
        var num = 0
        var node = head
        while node != nil {
            node = node?.next
            num += 1
        }
        
        if n == num {
            return head?.next
        }
        
        var prev: ListNode? = nil
        node = head
        for _ in 0..<(num-n) {
            prev = node
            node = node?.next
        }
        prev?.next = node?.next
        return head
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
assert(s.removeNthFromEnd(makeNumList(nums: [1]), 1).toArr() == [])
assert(s.removeNthFromEnd(makeNumList(nums: [1,2]), 1).toArr() == [1])
assert(s.removeNthFromEnd(makeNumList(nums: [1,2]), 2).toArr() == [2])
assert(s.removeNthFromEnd(makeNumList(nums: [1,2,3]), 2).toArr() == [1,3])
print("done")
