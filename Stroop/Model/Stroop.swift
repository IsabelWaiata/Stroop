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
    
    func calculateScore() {
        
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
        
    }
}
