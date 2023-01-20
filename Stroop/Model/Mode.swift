//
//  Mode.swift
//  Stroop
//
//  Created by Neal Watkins on 2023/1/20.
//

import Foundation

extension Test {
    
    struct Mode: Codable, Equatable, Hashable {
        var language = Language.first
        var variable = false
        
        var label: String {
            language.label + " " + (variable ? "Variable" : "Control")
        }
        
        /// order of proceeding
        var next: Mode? {
            if let language = self.language.next { // continue until all languages are done
                return Mode(language: language, variable: self.variable)
            } else if variable == false { // move on to variable modes
                return Mode(language: Language.first, variable: true)
            } else { // all done
                return nil
            }
        }
        
        static var first: Mode {
            Mode(language: Language.first, variable: false)
        }
        
        static var random: Mode {
            Mode(language: Language.random, variable: Bool.random())
        }
        
        static let list: [Mode] = [
            Mode(language: .chinese, variable: false),
            Mode(language: .chinese, variable: true),
            Mode(language: .english, variable: false),
            Mode(language: .english, variable: true)
        ]
        
    }
    
    enum Language: String, Codable, Equatable, CaseIterable {
        case chinese
        case english
        
        var next: Language? {
            switch self {
            case .chinese: return .english
            case .english: return nil
            }
        }
        
        var label: String {
            switch self {
            case .chinese : return "中文"
            case .english : return "English"
            }
        }
        
        static var first: Language {
            Language.allCases.first!
        }
        
        static var random: Language {
            Language.allCases.randomElement()!
        }
    }
    
}
