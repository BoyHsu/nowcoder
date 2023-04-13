//
//  main.swift
//  DeleteDuplicates_II
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
     * @return ListNode类
     */
    func deleteDuplicates ( _ head: ListNode?) -> ListNode? {
        var _head: ListNode? = nil
        var nonDup: ListNode? = nil
        var node = head
        while node != nil {
            if node?.val == node?.next?.val {
                let val = node?.val
                node = node?.next?.next
                while node?.val == val {
                    node = node?.next
                }
            } else {
                nonDup?.next = node
                nonDup = node
                if _head == nil {
                    _head = nonDup
                }
                node = node?.next
            }
        }
        nonDup?.next = nil
        return _head
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
assert(s.deleteDuplicates(makeNumList(nums: [1,1,1,1,2,2,2])) == nil)
assert(s.deleteDuplicates(makeNumList(nums: [1,1,1,1,2,2,3])).toArr() == makeNumList(nums: [3]).toArr())
assert(s.deleteDuplicates(makeNumList(nums: [1,1,1,1,2,3])).toArr() == makeNumList(nums: [2,3]).toArr())
assert(s.deleteDuplicates(makeNumList(nums: [1,2,2,3,3])).toArr() == makeNumList(nums: [1]).toArr())
assert(s.deleteDuplicates(makeNumList(nums: [1,2,2,3])).toArr() == makeNumList(nums: [1,3]).toArr())
print("done")
