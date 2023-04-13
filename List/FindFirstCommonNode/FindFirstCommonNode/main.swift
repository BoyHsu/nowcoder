//
//  main.swift
//  FindFirstCommonNode
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
     * @param pHead1 ListNode类
     * @param pHead2 ListNode类
     * @return ListNode类
     */
    func FindFirstCommonNode ( _ pHead1: ListNode?,  _ pHead2: ListNode?) -> ListNode? {
        var n1 = 0
        var node1 = pHead1
        while node1 != nil {
            n1 += 1
            node1 = node1?.next
        }
        
        var n2 = 0
        var node2 = pHead2
        while node2 != nil {
            n2 += 1
            node2 = node2?.next
        }
        
        node1 = pHead1
        node2 = pHead2
        if n1 > n2 {
            for _ in 0..<(n1-n2) {
                node1 = node1?.next
            }
        } else {
            for _ in 0..<(n2-n1) {
                node2 = node2?.next
            }
        }
        
        while node1 != nil, node2 != nil, node1 !== node2 {
            node1 = node1?.next
            node2 = node2?.next
        }
        return node1
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
//{1,2,3},{4,5},{6,7}
let node7 = ListNode(7)
let node6 = ListNode(6, node7)

let node5 = ListNode(5, node6)
let node4 = ListNode(4, node5)

let node3 = ListNode(3, node6)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)

assert(s.FindFirstCommonNode(node1, node4).toArr() == [6,7])
assert(s.FindFirstCommonNode(makeNumList(nums: [1]), makeNumList(nums: [2,3])).toArr() == [])
print("done")
