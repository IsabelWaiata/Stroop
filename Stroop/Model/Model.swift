//
//  Model.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/2/22.
//

import Foundation

struct Model: Codable {
    
    // MARK: - Coding
    
    enum CodingKeys: String, CodingKey {
        case tests
        case score
    }
    
    var tests = [Test]()
    var score = Test.Score()
    
    var totalScore: Test.Score {
        var total = Test.Score()
        for test in tests {
            total += test.score
        }
        return total
    }
}
