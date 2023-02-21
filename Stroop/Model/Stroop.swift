//
//  Stroop.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import Foundation

class Stroop: Codable, ObservableObject {
    
    enum CodingKeys: String, CodingKey {
        case tests
        case score
    }
    
    
    var tests = [Test]()
    
    var score = Test.Score()
    
    @Published var test = Test()
    @Published var phase = Phase.info
    
    /// add up all the test scores
    func calculateScore() {
        score = Test.Score()
        for test in tests {
            score += test.score
        }
    }
    
    /// total score for mode
    func score(for mode: Test.Mode) -> Test.Score {
        var total = Test.Score()
        for test in self.tests {
            let score = test.score(for: mode)
            total += score
        }
        return total
    }
    
    func saveTest() {
        tests.append(test)
        calculateScore()
    }
        
    func nextTest() {
        test = Test()
    }
    
    @discardableResult
    func guess(_ colour: Colour) -> Bool? {
        guard let mode = phase.mode else { return nil }
        test.current.mode = mode
        let good = test.guess(colour)
        test = test // publish update
        return good
    }
    
    func backPhase() {
        phase = phase.back
        test.retry()
    }
    
    func nextPhase() {
        phase = phase.next
        test.retry()
    }
    
    
   
}
