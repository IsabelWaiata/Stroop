//
//  Stroop.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import Foundation

class Stroop: Codable, ObservableObject {
    
    // MARK: - Coding
    
    enum CodingKeys: String, CodingKey {
        case tests
        case score
    }
    
    var tests = [Test]()
    var score = Test.Score()
    
    // MARK: - Publishing
    
    @Published var test = Test()
    @Published var phase = Phase.info {
        didSet {
            test.retry()
        }
    }
    
    
    // MARK: - Scoring
    
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
    
    // MARK: - Testing
    
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
    
    // MARK: - Phasing
    
    func backPhase() {
        phase = phase.back
    }
    
    func nextPhase() {
        phase = phase.next
    }
    
    
   
}
