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
    
    func saveTest() {
        tests.append(test)
        calculateScore()
    }
        
    func nextTest() {
        test = Test()
    }
    
    func guess(_ colour: Colour) {
        guard let mode = phase.mode else { return}
        test.current.mode = mode
        test.guess(colour)
        test = test
    }
    
    func backPhase() {
        phase = phase.back
    }
    
    func nextPhase() {
        phase = phase.next
    }
    
    
   
}
