//
//  Sample.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/18.
//

import Foundation

struct Sample {
    
    static var randomTry: Test.Try {
        let colour = Colour.random
        return Test.Try(
            mode: Test.Mode.random,
            word: colour,
            tint: Colour.random,
            pick: (Int.random(in: 0 ... 9 ) < 7) ? colour : Colour.random,
            time: Stopwatch(Double.random(in: 0.5 ... 2.0))
            )
    }
    
    static var randomTrys: [Test.Try] {
        var trys = [Test.Try]()
        for _ in 1...40 {
            trys.append(randomTry)
        }
        return trys
    }
    
    static var randomScore: Test.Score {
        Test.Score(randomTrys)
    }
    
    static var randomTest: Test {
        let test = Test()
        test.trys = randomTrys
        test.recalculateScore()
        return test
    }
    
    static var randomTests: [Test] {
        var tests = [Test]()
        for _ in 1...4 {
            tests.append(randomTest)
        }
        return tests
    }
    
    static var stroop: Stroop {
        let stroop = Stroop()
        stroop.phase = .test(.random)
        stroop.test = randomTest
        stroop.model = model
        return stroop
    }
    
    static var model: Model {
        var model = Model()
        model.tests = randomTests
        model.score = model.totalScore
        return model
    }
    
    static func stroop(_ mode: Test.Mode) -> Stroop {
        let stroop = Stroop()
        stroop.phase = .test(mode)
        return stroop
    }
    
    static func example(_ language: Test.Language, variable: Bool = true) -> Stroop {
        let stroop = Stroop()
        stroop.phase = .test(Test.Mode(language: language, variable: variable))
        return stroop
    }
    
}
