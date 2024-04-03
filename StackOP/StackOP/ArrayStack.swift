//
//  ArrayStack.swift
//  StackOP
//
//  Created by 国富集团赵 on 2024/2/19.
//

import Foundation
/* 基于数组实现的栈 */
class ArrayStack {
    private var stack: [Int]
    init() {
        // 初始化列表（动态数组）
        stack = []
    }
    /* 获取栈的长度 */
    func size() -> Int {
        stack.count
    }
    /* 判断栈是否为空 */
    func isEmpty() -> Bool {
        stack.isEmpty
    }
    /* 入栈 */
    func push(num: Int) {
        stack.append(num)
    }
    /* 出栈 */
    @discardableResult
    func pop() -> Int {
        if isEmpty() {
            fatalError(" 栈为空")
        }
        return stack.removeLast()
    }
    /* 访问栈顶元素 */
    func peek() -> Int {
        if isEmpty() {
            fatalError(" 栈为空")
        }
        return stack.last!
    }
    /* 将 List 转化为 Array 并返回 */
    func toArray() -> [Int] {
        stack
    }
}
