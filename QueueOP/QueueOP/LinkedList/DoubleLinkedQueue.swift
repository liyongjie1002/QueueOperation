//
//  DoubleLinkedQueue.swift
//  QueueOP
//
//  Created by 国富集团赵 on 2024/2/19.
//

import Foundation

/* 基于双向链表实现的双向队列 */
class LinkedListDeque {
    private var front: DoubleListNode? // 头节点 front
    private var rear: DoubleListNode? // 尾节点 rear
    private var queSize: Int // 双向队列的长度
    init() {
        queSize = 0
    }
    /* 获取双向队列的长度 */
    func size() -> Int {
        queSize
    }
    /* 判断双向队列是否为空 */
    func isEmpty() -> Bool {
        size() == 0
    }
    /* 入队操作 */
    private func push(num: Int, isFront: Bool) {
        let node = DoubleListNode(val: num)
        // 若链表为空，则令 front 和 rear 都指向 node
        if isEmpty() {
            front = node
            rear = node
        }
        // 队首入队操作
        else if isFront {
            // 将 node 添加至链表头部
            front?.prev = node
            node.next = front
            front = node // 更新头节点
        }
        // 队尾入队操作
        else {
            // 将 node 添加至链表尾部
            rear?.next = node
            node.prev = rear
            rear = node // 更新尾节点
        }
        queSize += 1 // 更新队列长度
    }
    /* 队首入队 */
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }
    /* 队尾入队 */
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }
    /* 出队操作 */
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError(" 双向队列为空")
        }
        let val: Int
        // 队首出队操作
        if isFront {
            val = front!.val // 暂存头节点值
            // 删除头节点
            let fNext = front?.next
            if fNext != nil {
                fNext?.prev = nil
                front?.next = nil
            }
            front = fNext // 更新头节点
        }
        // 队尾出队操作
        else {
            val = rear!.val // 暂存尾节点值
            // 删除尾节点
            let rPrev = rear?.prev
            if rPrev != nil {
                rPrev?.next = nil
                rear?.prev = nil
            }
            rear = rPrev // 更新尾节点
        }
        queSize -= 1 // 更新队列长度
        return val
    }
    /* 队首出队 */
    func popFirst() -> Int {
        pop(isFront: true)
    }
    /* 队尾出队 */
    func popLast() -> Int {
        pop(isFront: false)
    }
    /* 访问队首元素 */
    func peekFirst() -> Int? {
        isEmpty() ? nil : front?.val
    }
    /* 访问队尾元素 */
    func peekLast() -> Int? {
        isEmpty() ? nil : rear?.val
    }
    /* 返回数组用于打印 */
    func toArray() -> [Int] {
        var node = front
        var res = Array(repeating: 0, count: size())
        for i in res.indices {
            res[i] = node!.val
            node = node?.next
        }
        return res
    }
}
