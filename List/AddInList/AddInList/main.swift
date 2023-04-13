//
//  main.swift
//  AddInList
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
     * @param head1 ListNode类
     * @param head2 ListNode类
     * @return ListNode类
     */
    func addInList ( _ head1: ListNode?,  _ head2: ListNode?) -> ListNode? {
        var p1 = revertList(head1)
        var p2 = revertList(head2)
        var carry = false
        var res: ListNode? = nil
        while p1 != nil || p2 != nil {
            let sum = (p1?.val ?? 0) + (p2?.val ?? 0) + (carry ? 1 : 0)
            carry = sum >= 10
            res = ListNode(sum%10, res)
            
            p1 = p1?.next
            p2 = p2?.next
        }
        if carry {
            res = ListNode(1, res)
        }
        return res
    }
    
    func revertList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var node: ListNode? = head
        while node != nil {
            let next = node?.next
            node?.next = prev
            prev = node
            node = next
        }
        return prev
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
//[9,3,7],[6,3] {1,0,0,0}
assert(s.addInList(makeNumList(nums: [9,3,7]), makeNumList(nums: [6,3])).toArr() == [1,0,0,0])
//[0],[6,3] {6,3}
assert(s.addInList(makeNumList(nums: [0]), makeNumList(nums: [6,3])).toArr() == [6,3])
print("done")
