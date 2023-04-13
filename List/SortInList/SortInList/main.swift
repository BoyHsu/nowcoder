//
//  main.swift
//  SortInList
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
     * @param head ListNode类 the head node
     * @return ListNode类
     */
    func sortInList ( _ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var slow = head, fast = head?.next
        while fast != nil, fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        let newHead = slow?.next
        slow?.next = nil
        var l = sortInList(head)
        var r = sortInList(newHead)
        var head: ListNode? = nil
        var prev: ListNode? = nil
        while l != nil || r != nil {
            if (l?.val ?? Int.max) <= (r?.val ?? Int.max) {
                prev?.next = l
                prev = l
                l = l?.next
            } else {
                prev?.next = r
                prev = r
                r = r?.next
            }
            if head == nil {
                head = prev
            }
        }
        
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
assert(s.sortInList(makeNumList(nums: [1,3,2,4,5])).toArr() == [1,2,3,4,5])
print("done")
