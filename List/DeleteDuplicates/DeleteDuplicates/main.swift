//
//  main.swift
//  DeleteDuplicates
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
        guard let head = head else { return nil }
        var prev = head, node = head.next
        while node != nil {
            if prev.val != node!.val {
                prev.next = node
                prev = node!
            }
            node = node?.next
        }
        prev.next = nil
        return head
    }
}

