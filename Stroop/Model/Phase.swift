//
//  Phase.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/30.
//

import Foundation

extension Stroop {
    enum Phase: Hashable {
        case info
        case test(Test.Mode)
        case mark
        
        
        var label: String {
            switch self {
            case .info: return "Start"
            case .test(let mode): return mode.label
            case .mark: return "Results"
            }
        }
        
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
