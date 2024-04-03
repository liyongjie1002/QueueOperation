//
//  ArrayQueue.swift
//  QueueOP
//
//  Created by 国富集团赵 on 2024/2/19.
//

import Foundation
/* 基于环形数组实现的队列 */
class ArrayQueue {
    private var nums: [Int] // 用于存储队列元素的数组
    private var front = 0 // 队首指针，指向队首元素
    private var queSize = 0 // 队列长度
    init(capacity: Int) {
        // 初始化数组
        nums = Array(repeating: 0, count: capacity)
    }
    /* 获取队列的容量 */
    func capacity() -> Int {
        nums.count
    }
    /* 获取队列的长度 */
    func size() -> Int {
        queSize
    }
    /* 判断队列是否为空 */
    func isEmpty() -> Bool {
        queSize == 0
    }
    /* 入队 */
    func push(num: Int) {
        if size() == capacity() {
            print(" 队列已满")
            return
        }
        // 计算队尾指针，指向队尾索引 + 1
        // 通过取余操作实现 rear 越过数组尾部后回到头部
        let rear = (front + queSize) % capacity()
        // 将 num 添加至队尾
        nums[rear] = num
        queSize += 1
    }
    /* 出队 */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 队首指针向后移动一位，若越过尾部，则返回到数组头部
        front = (front + 1) % capacity()
        queSize -= 1
        return num
    }
    /* 访问队首元素 */
    func peek() -> Int {
        if isEmpty() {
            fatalError(" 队列为空")
        }
        return nums[front]
    }
    /* 返回数组 */
    func toArray() -> [Int] {
        // 仅转换有效长度范围内的列表元素
        var res = Array(repeating: 0, count: queSize)
        for (i, j) in sequence(first: (0, front), next: { $0 < self.queSize - 1 ? ($0 + 1, $1 + 1) : nil }) {
            res[i] = nums[j % capacity()]
        }
        return res
    }
}
