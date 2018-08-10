//
//  SynchronizedArray.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/10/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

class SynchronizedArray<T> {
    private var array: [T] = []
    
    private let accessQueue = DispatchQueue(label: "synchronizedArrayAccessQueue", qos: .userInteractive)
    
    var count: Int {
        var count = 0
        
        accessQueue.sync {
            count = self.array.count
        }
        
        return count
    }
    
    func append(_ newElement: T) {
        accessQueue.async(flags: .barrier) {
            self.array.append(newElement)
        }
    }
    
    func remove(at index: Int) -> T {
        var element: T!
        
        accessQueue.sync {
            element = self.array.remove(at: index)
        }
        
        return element
    }
    
    subscript(index: Int) -> T {
        set {
            accessQueue.async(flags: .barrier) {
                self.array[index] = newValue
            }
        }
        
        get {
            var element: T!
            
            accessQueue.sync {
                element = self.array[index]
            }
            
            return element
        }
    }
}

extension SynchronizedArray where T: Equatable {
    func index(of element: T) -> Int? {
        var index: Int?
        
        accessQueue.sync {
            index = self.array.index(of: element)
        }
        
        return index
    }
}

extension SynchronizedArray: CustomStringConvertible where T: CustomStringConvertible {
    var description: String {
        return array.description
    }
}
