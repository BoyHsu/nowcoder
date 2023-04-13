//
//  main.swift
//  Merge
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
     * @param pHead1 ListNode类
     * @param pHead2 ListNode类
     * @return ListNode类
     */
    func Merge ( _ pHead1: ListNode?,  _ pHead2: ListNode?) -> ListNode? {
        var head: ListNode? = nil, prev: ListNode? = nil
        
        var p1 = pHead1, p2 = pHead2
        
        if (p1?.val ?? Int.max) < (p2?.val ?? Int.max) {
            head = p1
            p1 = p1?.next
        } else {
            head = p2
            p2 = p2?.next
        }
        prev = head
        
        while p1 != nil || p2 != nil {
            if (p1?.val ?? Int.max) < (p2?.val ?? Int.max) {
                prev?.next = p1
                p1 = p1?.next
            } else {
                prev?.next = p2
                p2 = p2?.next
            }
            prev = prev?.next
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
//{1,3,5},{2,4,6} {1,2,3,4,5,6}
assert(s.Merge(makeNumList(nums: [1,3,5]), makeNumList(nums: [2,4,6])).toArr() == makeNumList(nums: [1,2,3,4,5,6]).toArr())

assert(s.Merge(makeNumList(nums: [-5,-3,-1]), makeNumList(nums: [-6,-4,-2])).toArr() == makeNumList(nums: [-6,-5,-4,-3,-2,-1]).toArr())

assert(s.Merge(makeNumList(nums: []), makeNumList(nums: [])).toArr() == makeNumList(nums: []).toArr())
//{-1,2,4},{1,3,4} // {-1,1,2,3,4,4}
assert(s.Merge(makeNumList(nums: [-1,2,4]), makeNumList(nums: [1,3,4])).toArr() == makeNumList(nums: [-1,1,2,3,4,4]).toArr())
print("done")

