//
//  main.swift
//  EntryNodeOfLoop
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
     * @param pHead ListNode类
     * @return ListNode类
     */
    func EntryNodeOfLoop ( _ pHead: ListNode?) -> ListNode? {
        var p1 = pHead, p2 = pHead
        while p1 != nil, p2 != nil {
            p1 = p1?.next
            p2 = p2?.next?.next
            
            if p1 === p2 {
                break
            }
        }
        
        if p1 == nil {
            return nil
        }
        
        p1 = pHead
        while p1 !== p2 {
            p1 = p1?.next
            p2 = p2?.next
        }
        return p1
    }
}

