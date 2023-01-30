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
    
    @discardableResult
    func guess(_ colour: Colour) -> Bool? {
        current.pick = colour
        score.mark(current)
        trys.append(current)
        let good = current.correct
        current = Try()
        return good
    }
    
}
