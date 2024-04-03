//
//  ViewController.swift
//  LinkedListOP
//
//  Created by 国富集团赵 on 2024/2/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configLinkedList()
    }

    func configLinkedList() {
        
        let n0 = ListNode(x: 1)
        let n1 = ListNode(x: 3)
        let n2 = ListNode(x: 2)
        let n3 = ListNode(x: 5)
        let n4 = ListNode(x: 4)

        n0.next = n1
        n1.next = n2
        n2.next = n3
        n3.next = n4
    }
    
    // insert
    func insert(n0: ListNode, P: ListNode) {
        let n1 = n0.next
        P.next = n1
        n0.next = P
    }
    // delete
    func delete(n0: ListNode) {
        if n0.next == nil {
            return
        }
        let P = n0.next
        let n1 = P?.next
        n0.next = n1
        P?.next = nil
    }
    // access
    func access(head: ListNode, index: Int) -> ListNode? {
        var head: ListNode? = head
        for _ in 0 ..< index {
            if head == nil {
                return nil
            }
            head = head?.next
        }
        return head
    }
    // find
    func find(head: ListNode, target: Int) -> Int {
        var head: ListNode? = head
        var index = 0
        while head != nil {
            if head?.value == target {
                return index
            }
            head = head?.next
            index += 1
        }
        return -1
    }
}

