//
//  main.swift
//  ReverseList
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
     * @return ListNode类
     */
    func ReverseList ( _ head: ListNode?) -> ListNode? {
        var p: ListNode? = head
        var last: ListNode? = nil
        while p != nil {
            let next = p?.next
            p?.next = last
            last = p
            p = next
        }
        return last
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
assert(s.ReverseList(makeNumList(nums: [1, 2, 3])).toArr() == makeNumList(nums: [3, 2, 1]).toArr())
assert(s.ReverseList(makeNumList(nums: [])).toArr() == [])
print("done")
