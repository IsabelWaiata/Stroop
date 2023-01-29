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
    
    
    enum Phase: Hashable {
        case info
        case test(Test.Mode)
        case mark
        
        var mode: Test.Mode? {
            switch self {
            case .test(let mode): return mode
            default: return nil
            }
        }
        
        var back: Phase {
            switch self {
            case .info: return .info
            case .test(let mode):
                guard let next = mode.back else { return .info }
                return .test(next)
            case .mark: return .test(.list.last!)
            }
        }
        
        var next: Phase {
            switch self {
            case .info: return .test(.list.first!)
            case .test(let mode):
                guard let next = mode.next else { return .mark }
                return .test(next)
            case .mark: return .info
            }
        }
        
    }
}
