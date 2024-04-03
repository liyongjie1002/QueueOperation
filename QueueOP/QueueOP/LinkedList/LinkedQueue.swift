//
//  LinkedQueue.swift
//  QueueOP
//
//  Created by 国富集团赵 on 2024/2/19.
//

import Foundation
/* 基于链表实现的队列 */
class LinkedListQueue {
    private var front: ListNode? // 头节点
    private var rear: ListNode? // 尾节点
    private var _size = 0
    init() {}
    /* 获取队列的长度 */
    func size() -> Int {
        _size
    }
    /* 判断队列是否为空 */
    func isEmpty() -> Bool {
        size() == 0
    }
    /* 入队 */
    func push(num: Int) {
        // 在尾节点后添加 num
        let node = ListNode(x: num)
        // 如果队列为空，则令头、尾节点都指向该节点
        if front == nil {
            front = node
            rear = node
        }
        // 如果队列不为空，则将该节点添加到尾节点后
        else {
            rear?.next = node
            rear = node
        }
        _size += 1
    }
    /* 出队 */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 删除头节点
        front = front?.next
        _size -= 1
        return num
    }
    /* 访问队首元素 */
    func peek() -> Int {
        if isEmpty() {
            fatalError(" 队列为空")
        }
        return front!.value
    }
    /* 将链表转化为 Array 并返回 */
    func toArray() -> [Int] {
        var node = front
        var res = Array(repeating: 0, count: size())
        for i in res.indices {
            res[i] = node!.value
            node = node?.next
        }
        return res
    }
}
