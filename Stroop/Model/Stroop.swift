//
//  Stroop.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/17.
//

import Foundation

class Stroop: ObservableObject {
    
    init() { }
    
    init(_ model: Model) {
        self.model = model
    }
    
    // MARK: - Publishing
    
    @Published var test = Test()
    @Published var phase = Phase.info
    @Published var model = Model()
    
    // MARK: - Scoring
    
    /// total score for mode
    func score(for mode: Test.Mode) -> Test.Score {
        var total = Test.Score()
        for test in model.tests {
            let score = test.score(for: mode)
            total += score
        }
        return total
    }
    
    // MARK: - Testing
    
    func saveTest() {
        model.tests.append(test)
        model.score = model.totalScore
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
        test.retry()
    }
    
    func nextPhase() {
        phase = phase.next
        test.retry()
    }
    
    
   
}
