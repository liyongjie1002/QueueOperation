//
//  DoubleArrayQueue.swift
//  QueueOP
//
//  Created by 国富集团赵 on 2024/2/19.
//

/*
 应用：撤销用栈，限制数量时可使用双向队列
 */
import Foundation
/* 基于环形数组实现的双向队列 */
class ArrayDeque {
    private var nums: [Int] // 用于存储双向队列元素的数组
    private var front: Int // 队首指针，指向队首元素
    private var queSize: Int // 双向队列长度
    /* 构造方法 */
    init(capacity: Int) {
        nums = Array(repeating: 0, count: capacity)
        front = 0
        queSize = 0
    }
    /* 获取双向队列的容量 */
    func capacity() -> Int {
        nums.count
    }
    /* 获取双向队列的长度 */
    func size() -> Int {
        queSize
    }
    /* 判断双向队列是否为空 */
    func isEmpty() -> Bool {
        size() == 0
    }
    /* 计算环形数组索引 */
    private func index(i: Int) -> Int {
        // 通过取余操作实现数组首尾相连
        // 当 i 越过数组尾部后，回到头部
        // 当 i 越过数组头部后，回到尾部
        (i + capacity()) % capacity()
    }
    /* 队首入队 */
    func pushFirst(num: Int) {
        if size() == capacity() {
            print(" 双向队列已满")
            return
        }
        // 队首指针向左移动一位
        // 通过取余操作实现 front 越过数组头部后回到尾部
        front = index(i: front - 1)
        // 将 num 添加至队首
        nums[front] = num
        queSize += 1
    }
    /* 队尾入队 */
    func pushLast(num: Int) {
        if size() == capacity() {
            print(" 双向队列已满")
            return
        }
        // 计算队尾指针，指向队尾索引 + 1
        let rear = index(i: front + size())
        // 将 num 添加至队尾
        nums[rear] = num
        queSize += 1
    }
    /* 队首出队 */
    func popFirst() -> Int {
        let num = peekFirst()
        // 队首指针向后移动一位
        front = index(i: front + 1)
        queSize -= 1
        return num
    }
    /* 队尾出队 */
    func popLast() -> Int {
        let num = peekLast()
        queSize -= 1
        return num
    }
    /* 访问队首元素 */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError(" 双向队列为空")
        }
        return nums[front]
    }
    /* 访问队尾元素 */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError(" 双向队列为空")
        }
        // 计算尾元素索引
        let last = index(i: front + size() - 1)
        return nums[last]
    }
    /* 返回数组用于打印 */
    func toArray() -> [Int] {
        // 仅转换有效长度范围内的列表元素
        var res = Array(repeating: 0, count: size())
        for (i, j) in sequence(first: (0, front), next: { $0 < self.size() - 1 ? ($0 + 1, $1 + 1) : nil }) {
            res[i] = nums[index(i: j)]
        }
        return res
    }
}
