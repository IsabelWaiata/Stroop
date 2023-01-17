//
//  Stopwatch.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import Foundation
@propertyWrapper
struct Stopwatch: Codable {
    
    var wrappedValue: TimeInterval {
        let end = finished ?? Date()
        return end.timeIntervalSince(started)
    }
    
    var started = Date()
    var finished: Date?
    
    mutating func stop() {
        finished = Date()
    }
    
}
