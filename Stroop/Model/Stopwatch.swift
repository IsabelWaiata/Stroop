//
//  Stopwatch.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import Foundation
@propertyWrapper
struct Stopwatch: Codable {
    
    init() { }
    
    init(_ time: TimeInterval) {
        wrappedValue = time
    }
    
    var wrappedValue: TimeInterval {
        get {
            let end = finished ?? Date()
            return end.timeIntervalSince(started)
        }
        set {
            finished = Date()
            started = finished!.addingTimeInterval(0 - newValue)
        }
    }
    
    var started = Date()
    var finished: Date?
    
    mutating func stop() {
        finished = Date()
    }
    
}
