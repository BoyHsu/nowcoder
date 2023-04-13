//
//  main.swift
//  FindKthToTail
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
     * @param k int整型
     * @return ListNode类
     */
    func FindKthToTail ( _ pHead: ListNode?,  _ k: Int) -> ListNode? {
        var n = 0
        var node = pHead
        while node != nil {
            n += 1
            node = node?.next
        }
        
        if k > n {
            return nil
        }
        
        node = pHead
        for _ in 0..<(n-k) {
            node = node?.next
        }
        return node
    }
}

