//
//  ListNode.swift
//  LinkedListOP
//
//  Created by 国富集团赵 on 2024/2/18.
//

import Foundation

class ListNode {
    var value = 0
    var next: ListNode?
    
    init (x: Int) {
        self.value = x
    }
}


class DoubleListNode {
    var value = 0
    var next: DoubleListNode?
    var prev: DoubleListNode?
    
    init(x: Int) {
        self.value = x
    }
}

