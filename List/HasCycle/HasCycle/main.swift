//
//  main.swift
//  HasCycle
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
     * @return bool布尔型
     */
    func hasCycle ( _ head: ListNode?) -> Bool {
        var p1 = head, p2 = head
        while p1 != nil, p2 != nil {
            p1 = p1?.next
            p2 = p2?.next?.next
            if p1 === p2 {
                return true
            }
        }
        return false
    }
}

