//
//  Queue.swift
//  GraphicMotionApplication
//
//  Created by ICoon on 04.02.2022.
//  Copyright © 2022 ipinguin_linuxoid. All rights reserved.
//


/**
 source -> https://benoitpasquier.com/data-structure-implement-queue-swift/
 */
struct Queue<T> {
    
    private var elements: [T] = []
    
    mutating func enqueue(_ value: T) {
        elements.append(value)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeFirst()
    }
    
    mutating func count() -> Int{
        return elements.count
    }
    
    mutating func setup(_ values: [T]){
        self.elements = values
    }
    
    mutating func getElements() ->  [T]{
        return elements
    }
    
    mutating func getElement(index: Int) -> T{
        return elements[index]
    }
    
    mutating func push(_ value: T){
        self.enqueue(value)
        self.dequeue()
    }
    
    var head: T? {
        return elements.first
    }
    
    var tail: T? {
        return elements.last
    }
}
