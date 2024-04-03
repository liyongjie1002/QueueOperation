//
//  LinkedListStack.swift
//  StackOP
//
//  Created by 国富集团赵 on 2024/2/19.
//

import Foundation
/* 基于链表实现的栈 */
class LinkedListStack {
    private var _peek: ListNode? // 将头节点作为栈顶
    private var _size = 0 // 栈的长度
    init() {}
    /* 获取栈的长度 */
    func size() -> Int {
        _size
    }
    /* 判断栈是否为空 */
    func isEmpty() -> Bool {
        size() == 0
    }
    /* 入栈 */
    func push(num: Int) {
        let node = ListNode(x: num)
        node.next = _peek
        
        _peek = node
        _size += 1
    }
    /* 出栈 */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        _peek = _peek?.next
        _size -= 1
        return num
    }
    /* 访问栈顶元素 */
    func peek() -> Int {
        if isEmpty() {
            fatalError(" 栈为空")
        }
        return _peek!.value
    }
    /* 将 List 转化为 Array 并返回 */
    func toArray() -> [Int] {
        var node = _peek
        var res = Array(repeating: 0, count: _size)
        for i in sequence(first: res.count - 1, next: { $0 >= 0 + 1 ? $0 - 1 : nil }) {
            res[i] = node!.value
            node = node?.next
        }
        return res
    }
}
