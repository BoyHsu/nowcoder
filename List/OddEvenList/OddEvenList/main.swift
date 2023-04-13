//
//  main.swift
//  OddEvenList
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
     *
     * @param head ListNode类
     * @return ListNode类
     */
    func oddEvenList ( _ head: ListNode?) -> ListNode? {
        var odd: ListNode? = nil, even: ListNode? = nil, evenHead: ListNode? = nil
        var node: ListNode? = head
        var isOdd = true
        while node != nil {
            if isOdd {
                if let odd = odd {
                    odd.next = node
                }
                odd = node
            } else {
                if let even = even {
                    even.next = node
                } else {
                    evenHead = node
                }
                even = node
            }
            node = node?.next
            isOdd.toggle()
        }
        odd?.next = evenHead
        even?.next = nil
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
assert(s.oddEvenList(makeNumList(nums: [1,2,3,4,5,6])).toArr() == [1,3,5,2,4,6])
assert(s.oddEvenList(makeNumList(nums: [1,4,6,3,7])).toArr() == [1,6,7,4,3])
print("done")
