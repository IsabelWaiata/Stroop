//
//  Experiment.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import Foundation

class Test: Codable {
    
    var subject = Subject()

    var trys = [Try]()

    var current = Try()
    
    var score = Score()
    
    func recalculateScore() {
        score = Score(trys)
    }
    
    func score(for mode: Mode) -> Score {
        let trys = self.trys.filter { $0.mode == mode }
        return Score(trys)
    }
    
    func guess(_ colour: Colour) {
        current.pick = colour
        score.mark(current)
        trys.append(current)
        current = Try()
    }
    
    enum Mode: String, Codable, CaseIterable {
        case control
        case chinese
        case english
    }
    
    struct Try: Codable {
        var mode: Mode = .control
        var word: Colour = Colour.random   // written text of colour
        var tint: Colour = Colour.random   // random colour of text
        var pick: Colour?  {               // colour guessed by subject
            didSet { time.stop() }
        }
        var time = Stopwatch()
        
        var correct: Bool {
            pick == word
        }
    }
    
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
            guard time != 0 else { return nil }
            return Double(good) / time
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
        trysText + " in " + timeText + ". " + meanText
        }
    }
    
}
