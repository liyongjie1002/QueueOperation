//
//  DoubleListNode.swift
//  QueueOP
//
//  Created by 国富集团赵 on 2024/2/19.
//

import Foundation
/* 双向链表节点 */
class DoubleListNode {
    var val: Int // 节点值
    var next: DoubleListNode? // 后继节点引用
    weak var prev: DoubleListNode? // 前驱节点引用
    init(val: Int) {
        self.val = val
    }
}
