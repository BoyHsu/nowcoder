//
//  main.swift
//  MergeKLists
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
     * @param lists ListNode类一维数组
     * @return ListNode类
     */
    func mergeKLists ( _ lists: [ListNode?]) -> ListNode? {
        var lists = lists
        var head: ListNode? = nil, prev: ListNode? = nil
        
        while true {
            var minIndex = -1, minVal = Int.max
            for i in lists.indices {
                if let node = lists[i] {
                    if node.val < minVal {
                        minVal = node.val
                        minIndex = i
                    }
                }
            }
            
            if minIndex == -1 {
                break
            }
            
            let node = lists[minIndex]
            prev?.next = node
            prev = node
            if head == nil {
                head = node
            }
            lists[minIndex] = node?.next
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
//[{1,2,3},{4,5,6,7}] {1,2,3,4,5,6,7}
//[{1,2},{1,4,5},{6}] {1,1,2,4,5,6}

assert(s.mergeKLists([makeNumList(nums: [1,2,3]), makeNumList(nums: [4,5,6,7])]).toArr() == makeNumList(nums: [1,2,3,4,5,6,7]).toArr())

assert(s.mergeKLists([makeNumList(nums: [1,2]), makeNumList(nums: [1,4,5]), makeNumList(nums: [6])]).toArr() == makeNumList(nums: [1,1,2,4,5,6]).toArr())

print("done")
