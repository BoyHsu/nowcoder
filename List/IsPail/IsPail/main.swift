//
//  main.swift
//  IsPail
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
     * @param head ListNode类 the head
     * @return bool布尔型
     */
    func isPail ( _ head: ListNode?) -> Bool {
        guard let head = head else { return false }
        var stack = [head]
        var slow: ListNode? = head, fast = head.next
        while fast != nil, fast?.next != nil {
            slow = slow?.next
            stack.append(slow!)
            fast = fast?.next?.next
        }
        
        if slow?.next != nil {
            if fast == nil {
                stack.removeLast()
            }
            slow = slow?.next
        }
                
        while slow != nil, !stack.isEmpty, slow!.val == stack.last!.val {
            slow = slow?.next
            stack.removeLast()
        }
        
        return slow == nil && stack.isEmpty
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
//assert(s.isPail(makeNumList(nums: [])) == false)
//assert(s.isPail(makeNumList(nums: [1])) == true)
//assert(s.isPail(makeNumList(nums: [1,2])) == false)
assert(s.isPail(makeNumList(nums: [1,2,1])) == true)
assert(s.isPail(makeNumList(nums: [1,2,2,1])) == true)
assert(s.isPail(makeNumList(nums: [1,2,2,1,1])) == false)
assert(s.isPail(makeNumList(nums: [1,2,2,2,1])) == true)
assert(s.isPail(makeNumList(nums: [1,1,2,2,1])) == false)
print("done")
