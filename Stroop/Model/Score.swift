//
//  Score.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/20.
//

import Foundation


extension Test {
    
    struct Score: Codable {
        var trys: Int = 0
        var good: Int = 0
        var time: TimeInterval = 0
        
        init() { }
        
        init(_ trys: [Try] ) {
            for t in trys {
                mark(t)
            }
        }
        
        mutating func mark(_ guess: Try) {
            trys += 1
            time += guess.time.wrappedValue
            if guess.correct {
                good += 1
            }
        }
        
        /// proportion of correct answers
        var accuracy: Double {
            guard trys != 0 else { return 0 }
            return Double(good) / Double(trys)
        }
        
        /// number of good guesses per minute
        var gpm: Double {
            guard time != 0 else { return 0 }
            return Double(good) * 60 / time
        }
        
        /// average time per correct answer
        var mean: TimeInterval? {
            guard good != 0 else { return nil }
            return time / Double(good)
        }
        
        
        var meanText: String {
            guard let mean else { return "" }
            return "Average: " + String(format: "%0.2f", mean)
        }
        
        var timeText: String {
            String(format: "%0.2f", time) + " seconds"
        }
        
        var trysText: String {
            "\(good) / \(trys)"
        }
        
        var summary: String {
            trysText + " in " + timeText + "."
        }
        
        static func +=(lhs: inout Score, rhs: Score) {
            lhs.trys += rhs.trys
            lhs.good += rhs.good
            lhs.time += rhs.time
        }
    }
}
